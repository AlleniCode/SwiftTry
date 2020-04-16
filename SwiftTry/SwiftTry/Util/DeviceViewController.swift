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
// https://www.hangge.com/blog/cache/detail_1606.html
// https://www.hangge.com/blog/cache/detail_1607.html【使用CoreTelephony获取运营商信息、网络制式（4G、3G、2G）】


import UIKit
import CoreTelephony

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
    
    func deviceInfo() {
        //应用程序信息
        let infoDictionary = Bundle.main.infoDictionary!
        let appDisplayName = infoDictionary["CFBundleDisplayName"] //程序名称
        let majorVersion = infoDictionary["CFBundleShortVersionString"]//主程序版本号
        let minorVersion = infoDictionary["CFBundleVersion"]//版本号（内部标示）
        let appVersion = majorVersion as! String
         
        //设备信息
        let iosVersion = UIDevice.current.systemVersion //iOS版本
        let identifierNumber = UIDevice.current.identifierForVendor //设备udid
        let systemName = UIDevice.current.systemName //设备名称
        let model = UIDevice.current.model //设备型号
        let modelName = UIDevice.current.name //设备具体型号
        let localizedModel = UIDevice.current.localizedModel //设备区域化型号如A1533
         
        //打印信息
        print("程序名称：\(appDisplayName!)")
        print("主程序版本号：\(appVersion)")
        print("内部版本号：\(minorVersion!)")
        print("iOS版本：\(iosVersion)")
        print("设备udid：\(identifierNumber!)")
        print("设备名称：\(systemName)")
        print("设备型号：\(model)")
        print("设备具体型号：\(modelName)")
        print("设备区域化型号：\(localizedModel)")
    }
    
    func phoneInfo() {
        //获取并输出运营商信息
        let info = CTTelephonyNetworkInfo()
        if let carrier = info.subscriberCellularProvider {
            let currentRadioTech = info.currentRadioAccessTechnology!
            print("数据业务信息：\(currentRadioTech)")
            print("网络制式：\(getNetworkType(currentRadioTech: currentRadioTech))")
            print("运营商名字：\(carrier.carrierName!)")
            print("移动国家码(MCC)：\(carrier.mobileCountryCode!)")
            print("移动网络码(MNC)：\(carrier.mobileNetworkCode!)")
            print("ISO国家代码：\(carrier.isoCountryCode!)")
            print("是否允许VoIP：\(carrier.allowsVOIP)")
        }
    }
    //根据数据业务信息获取对应的网络类型
    func getNetworkType(currentRadioTech:String) -> String {
        var networkType = ""
        switch currentRadioTech {
        case CTRadioAccessTechnologyGPRS:
            networkType = "2G"
        case CTRadioAccessTechnologyEdge:
            networkType = "2G"
        case CTRadioAccessTechnologyeHRPD:
            networkType = "3G"
        case CTRadioAccessTechnologyHSDPA:
            networkType = "3G"
        case CTRadioAccessTechnologyCDMA1x:
            networkType = "2G"
        case CTRadioAccessTechnologyLTE:
            networkType = "4G"
        case CTRadioAccessTechnologyCDMAEVDORev0:
            networkType = "3G"
        case CTRadioAccessTechnologyCDMAEVDORevA:
            networkType = "3G"
        case CTRadioAccessTechnologyCDMAEVDORevB:
            networkType = "3G"
        case CTRadioAccessTechnologyHSUPA:
            networkType = "3G"
        default:
            break
        }
        return networkType
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
