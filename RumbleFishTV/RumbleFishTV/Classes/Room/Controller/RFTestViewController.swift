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
    
    private lazy var globelQueue: DispatchQueue = DispatchQueue.global()
    
    private var captureSession: AVCaptureSession?
    private var captureVideoPreviewLayer: AVCaptureVideoPreviewLayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}

// MARK: - 视频的开始采集和停止采集
extension RFTestViewController {
    @IBAction func startCapture() {
        let captureSession = AVCaptureSession()
        self.captureSession = captureSession
        
        let devices = AVCaptureDevice.devices(for: .video)
//        let captureDevice = devices.filter { (device) -> Bool in
//            return device.position == .front
//        }.first
        guard let captureDevice = devices.filter({ $0.position == .front }).first else { return }
        guard let captureInput = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(captureInput)
        
        let captureOutput = AVCaptureVideoDataOutput()
        captureOutput.setSampleBufferDelegate(self, queue: globelQueue)
        captureSession.addOutput(captureOutput)
        
        let captureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.captureVideoPreviewLayer = captureVideoPreviewLayer
        captureVideoPreviewLayer.frame = view.bounds
        view.layer.insertSublayer(captureVideoPreviewLayer, at: 0)
        
        captureSession.startRunning()
    }
    
    @IBAction func stopCapture() {
        captureSession?.stopRunning()
        captureSession = nil
        captureVideoPreviewLayer?.removeFromSuperlayer()
        captureVideoPreviewLayer = nil
    }
}

extension RFTestViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        print("DidOutputSampleBuffer.")
    }
}
