//
//  RFTestViewController.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/11/6.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit
import AVFoundation

class RFTestViewController: UIViewController {
    
    private lazy var videoQueue: DispatchQueue = DispatchQueue.global()
    private lazy var audioQueue: DispatchQueue = DispatchQueue.global()
    
    private var captureSession: AVCaptureSession?
    private var captureVideoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    private var videoInput: AVCaptureDeviceInput?
    private var videoOutput: AVCaptureVideoDataOutput?
    
    private var movieFileOutput: AVCaptureMovieFileOutput?

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}

// MARK: - 开始采集和停止采集
extension RFTestViewController {
    @IBAction func startCapture() {
        // 创建捕捉会话
        let captureSession = AVCaptureSession()
        self.captureSession = captureSession
        
        // 设置视频的输入&输出
        setVideoInputOutput()
        
        // 设置音频的输入&输出
        setAudioInputOutput()
        
        // 设置文件输出(可选,用于测试视频是否录制成功)
        let movieFileOutput = AVCaptureMovieFileOutput()
        captureSession.addOutput(movieFileOutput)
        let movieFileConnect = movieFileOutput.connection(with: .video)
        movieFileConnect?.preferredVideoStabilizationMode = .auto
        self.movieFileOutput = movieFileOutput
        
        // 添加视频预览层(可选,用于提升用户体验)
        let captureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.captureVideoPreviewLayer = captureVideoPreviewLayer
        captureVideoPreviewLayer.frame = view.bounds
        view.layer.insertSublayer(captureVideoPreviewLayer, at: 0)
        
        // 开始采集
        captureSession.startRunning()
        
        // 开始写入文件
        let path = DocumentPath + "/test.mp4"
        let fileURL = URL(fileURLWithPath: path)
        movieFileOutput.startRecording(to: fileURL, recordingDelegate: self)
    }
    
    @IBAction func stopCapture() {
        movieFileOutput?.stopRecording()
        movieFileOutput = nil
        captureSession?.stopRunning()
        captureSession = nil
        captureVideoPreviewLayer?.removeFromSuperlayer()
        captureVideoPreviewLayer = nil
    }
    
    @IBAction func switchScene() {
        guard var position = videoInput?.device.position else { return }
        position = position == .front ? .back : .front
        let devices = AVCaptureDevice.devices(for: .video)
        guard let captureDevice = devices.filter({ $0.position == position }).first else { return }
        guard let captureInput = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession?.beginConfiguration()
        captureSession?.removeInput(videoInput!)
        captureSession?.addInput(captureInput)
        captureSession?.commitConfiguration()
        videoInput = captureInput
    }
    
    private func setVideoInputOutput() {
        // 添加视频输入源
        let devices = AVCaptureDevice.devices(for: .video)
        //        let captureDevice = devices.filter { (device) -> Bool in
        //            return device.position == .front
        //        }.first
        guard let captureDevice = devices.filter({ $0.position == .front }).first else { return }
        guard let captureInput = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession?.addInput(captureInput)
        videoInput = captureInput
        
        // 添加视频输出源
        let captureOutput = AVCaptureVideoDataOutput()
        captureOutput.setSampleBufferDelegate(self, queue: videoQueue)
        captureSession?.addOutput(captureOutput)
        videoOutput = captureOutput
    }
    
    private func setAudioInputOutput() {
        // 添加音频输入源
        guard let device = AVCaptureDevice.default(for: .audio) else { return }
        guard let captureInput = try? AVCaptureDeviceInput(device: device) else { return }
        captureSession?.addInput(captureInput)
        
        // 添加音频输出源
        let captureOutput = AVCaptureAudioDataOutput()
        captureOutput.setSampleBufferDelegate(self, queue: audioQueue)
        captureSession?.addOutput(captureOutput)
//        audioConnection = captureOutput.connection(with: .audio) // 这句代码放到addOutput之后
    }
}

extension RFTestViewController: AVCaptureVideoDataOutputSampleBufferDelegate, AVCaptureAudioDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if connection == videoOutput?.connection(with: .video) {
            print("DidOutput[Video]SampleBuffer.")
        } else {
            print("DidOutput[Audio]SampleBuffer.")
        }
    }
}

extension RFTestViewController: AVCaptureFileOutputRecordingDelegate {
    func fileOutput(_ output: AVCaptureFileOutput, didStartRecordingTo fileURL: URL, from connections: [AVCaptureConnection]) {
        print("DidStartRecording.")
    }
    
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        print("DidFinishRecording.")
    }
}
