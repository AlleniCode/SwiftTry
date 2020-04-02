//
//  CoreLocationViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/4/1.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_783.html
// https://www.hangge.com/blog/cache/detail_784.html
// https://www.hangge.com/blog/cache/detail_785.html
// https://www.hangge.com/blog/cache/detail_787.html


import UIKit
import CoreLocation
import MapKit

class CoreLocationViewController: UIViewController, CLLocationManagerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        // 定位管理器
        let locationManager: CLLocationManager = CLLocationManager()
        locationManager.delegate = self
        // 设置定位精度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 更新距离
        locationManager.distanceFilter = 100
        // 发送授权申请
        locationManager.requestLocation()
        if CLLocationManager.locationServicesEnabled() {
            // 允许使用定位服务的话，开启定位服务更新
            locationManager.startUpdatingLocation()
            print("定位开始")
        }
        
        
        self.reverseGeocode()
        self.locationEncode()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 获取最新的坐标
        let currLocation:CLLocation = locations.last!
        print("经度：\(currLocation.coordinate.longitude)")
        // 获取纬度
        print("纬度：\(currLocation.coordinate.latitude)")
        // 获取海拔
        print("海拔：\(currLocation.altitude)")
        // 获取水平精度
        print("水平精度：\(currLocation.horizontalAccuracy)")
        // 获取垂直精度
        print("垂直精度：\(currLocation.verticalAccuracy)")
        // 获取方向
        print("方向：\(currLocation.course)")
        // 获取速度
        print("速度：\(currLocation.speed)")
    }
    
    /// 方向改变执行
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print("磁极方向：\(newHeading.magneticHeading)")
        print("真实方向：\(newHeading.trueHeading)")
        print("方向的精度：\(newHeading.headingAccuracy)")
        print("时间：\(newHeading.timestamp)")
    }
    
    /// 该方法必须实现
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
    /// 地理信息反编码
    func reverseGeocode() {
        let geocoder = CLGeocoder()
        let currentLocation = CLLocation(latitude: 32.029171, longitude: 118.788231)
            geocoder.reverseGeocodeLocation(currentLocation, completionHandler: {
            (placemarks:[CLPlacemark]?, error:Error?) -> Void in
            //强制转成简体中文
            let array = NSArray(object: "zh-hans")
            UserDefaults.standard.set(array, forKey: "AppleLanguages")
            //显示所有信息
            if error != nil {
                print("错误：\(error!.localizedDescription))")
                return
            }
             
            if let p = placemarks?[0] {
                print(p) //输出反编码信息
                var address = ""
                
                if let country = p.country {
                    address.append("国家：\(country)\n")
                }
                if let administrativeArea = p.administrativeArea {
                    address.append("省份：\(administrativeArea)\n")
                }
                if let subAdministrativeArea = p.subAdministrativeArea {
                    address.append("其他行政区域信息（自治区等）：\(subAdministrativeArea)\n")
                }
                if let locality = p.locality {
                    address.append("城市：\(locality)\n")
                }
                if let subLocality = p.subLocality {
                    address.append("区划：\(subLocality)\n")
                }
                if let thoroughfare = p.thoroughfare {
                    address.append("街道：\(thoroughfare)\n")
                }
                if let subThoroughfare = p.subThoroughfare {
                    address.append("门牌：\(subThoroughfare)\n")
                }
                if let name = p.name {
                    address.append("地名：\(name)\n")
                }
                if let isoCountryCode = p.isoCountryCode {
                    address.append("国家编码：\(isoCountryCode)\n")
                }
                if let postalCode = p.postalCode {
                    address.append("邮编：\(postalCode)\n")
                }
                if let areasOfInterest = p.areasOfInterest {
                    address.append("关联的或利益相关的地标：\(areasOfInterest)\n")
                }
                if let ocean = p.ocean {
                    address.append("海洋：\(ocean)\n")
                }
                if let inlandWater = p.inlandWater {
                    address.append("水源，湖泊：\(inlandWater)\n")
                }
                 
                print("地址信息：\n\(address)")
            } else {
                print("No placemarks!")
            }
        })
    }
    
    /// 地理信息编码
    func locationEncode() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString("南京市新街口大洋百货", completionHandler: {
            (placemarks:[CLPlacemark]?, error:Error?) -> Void in
             
            if error != nil {
                print("错误：\(error!.localizedDescription))")
                return
            }
            if let p = placemarks?[0] {
                print("经度：\(p.location!.coordinate.longitude)" + "纬度：\(p.location!.coordinate.latitude)")
            } else {
                print("No placemarks!")
            }
        })
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
