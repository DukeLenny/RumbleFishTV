//
//  Network.swift
//  RumbleFishTV
//
//  Created by LiDinggui on 2018/9/14.
//  Copyright © 2018年 MKTECH. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType: String {
    case get = "GET"
    case post = "POST"
}

// MARK: - 单例的几种实现方式
// 3.1全局变量写法(又称一句话写法)
// 在实际去实例化单例之前，是先由一个swfit_once调用了一个swift_once_block_invoke。
//private let sharedInstance = Network()
class Network {
    // 1.最丑陋的写法(OC写法),已废弃
    /*
    class var shared: Network {
        struct Static {
            static var instance: Network? = nil
            static var onceToken: dispatch_once_t = 0
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = Network()
        }
        return Static.instance!
    }
   */
    // 2.结构体写法
    /*
    class var shared: Network {
        struct Static {
            static let instance = Network()
        }
        return Static.instance
    }
    */
    // 3.2全局变量写法(又称一句话写法)
    /*
    class var shared: Network {
        return sharedInstance
    }
    */
    // 全局变量（静态成员变量和结构体以及枚举）的延迟构造器在其被第一次访问时会加载，并以dispatch_once的方式启动来确保初始化的原子性。这让你写代码时可以用一种很酷的方式来使用dispatch_once：直接用一个全局变量的构造器去做初始化并用private来修饰。 — Apple’s Swift Blog
    // 4.正确而优雅的写法,推荐
    static let shared = Network()
    
    // init的私有化
    private init() {} // 这就阻止其他对象使用这个类的默认的'()'初始化方法
}

// MARK: - 网络请求方法
extension Network {
    class func request(urlString: String, methodType: MethodType = .get, parameters: [String: Any]? = nil, headers: [String: String]? = nil, completionHandler: @escaping (Any?, Error?) -> Void) {
        let method: HTTPMethod = methodType == .get ? .get : .post
        
        Alamofire.request(urlString, method: method, parameters: parameters, headers: headers).responseJSON { (response) in
            completionHandler(response.value, response.error)
        }
    }
}
