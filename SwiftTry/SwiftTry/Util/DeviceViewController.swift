//
//  DeviceViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/4/1.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_746.html
// https://www.hangge.com/blog/cache/detail_747.html
// https://www.hangge.com/blog/cache/detail_781.html
// https://www.hangge.com/blog/cache/detail_782.html
// https://www.hangge.com/blog/cache/detail_793.html
// https://www.hangge.com/blog/cache/detail_1017.html


import UIKit

class DeviceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        // 屏幕大小尺寸
        let screenBounds: CGRect = UIScreen.main.bounds
        print(screenBounds)
        
        
        // 判断设备方向
        // 感知设备方向 - 开启监听设备方向
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        // 添加通知，监听设备方向改变
        NotificationCenter.default.addObserver(self, selector: #selector(receivedRotation), name: UIDevice.orientationDidChangeNotification, object: nil)
        // 关闭设备监听
        UIDevice.current.endGeneratingDeviceOrientationNotifications()
    }
    
    /// 通知监听触发的方法
    @objc func receivedRotation() {
        let device = UIDevice.current
        switch device.orientation{
            case .portrait:
                print("面向设备保持垂直，Home键位于下部")
            case .portraitUpsideDown:
                print("面向设备保持垂直，Home键位于上部")
            case .landscapeLeft:
                print("面向设备保持水平，Home键位于左侧")
            case .landscapeRight:
                print("面向设备保持水平，Home键位于右侧")
            case .faceUp:
                print("设备平放，Home键朝上")
            case .faceDown:
                print("设备平放，Home键朝下")
            case .unknown:
                print("方向未知")
            default:
                print("方向未知")
        }
    }
    
    
    /// 开始摇晃
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("开始摇晃")
    }
    
    /// 摇晃结束
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("摇晃结束")
    }
    
    /// 摇晃被意外终止
    override func motionCancelled(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("摇晃被意外终止")
    }
    
    /// 打电话
    func callSomeone() {
        // 自动打开拨号页面并自动拨打电话
        let urlString = "tel://123456"
        if let url = URL(string: urlString) {
            // 根据iOS系统版本，分别处理
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                    print(success)
                })
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
