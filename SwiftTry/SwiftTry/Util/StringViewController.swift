//
//  StringViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/24.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_698.html
// https://www.hangge.com/blog/cache/detail_699.html
// https://www.hangge.com/blog/cache/detail_740.html
// https://www.hangge.com/blog/cache/detail_798.html
// https://www.hangge.com/blog/cache/detail_806.html


import UIKit

class StringViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        var str: String = ""
        if str.isEmpty {
            print("空字符串")
        }
        
        str = "123"
        let count = str.count
        print(count)
        
        
        let hexStr = "FF"
        let value = hexStr.hexStringToInt()
        print(value)
        
        
        self.numberFormat()
    }
    
    /// 数字格式化成字符串
    func numberFormat() {
        // 浮点类型的数字转成String字符串
        let f = 123.32342342
        let s: String = "\(f)" // 123.32342342
        print(s)
        
        // 保留两位小数
        let f1 = 123.32342342
        let s1 = String(format: "%.2f", f1) // 123.32
        print(s1)
        
        // 转成十六进制格式字符串
        let i = 255
        let s2: String = String(format: "%x", i) // ff
        print(s2)
        
        // 不足六位前面补0
        let i1 = 255
        let s3:String = String(format: "%06x", i1) // 0000ff
        print(s3)
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

extension String {
    /// 十六进制字符串转化为Int
    func hexStringToInt() -> Int {
        let str = self.uppercased()
        var sum = 0
        for i in str.utf8 {
            sum = sum * 16 + Int(i) - 48 // 0-9 从48开始
            if i >= 65 {                 // A-Z 从65开始，但有初始值10，所以应该是减去55
                sum -= 7
            }
        }
        return sum
    }
}

extension String {
    func hexStringColor(hexColor: String) -> UIColor {
        let color:uint = UInt32(hexColor)!
        let r:uint = color >> 16  //0x44
        let g:uint = color >> 8 & 0xFF  //0x55
        let b:uint = color & 0xFF  //0x77
        
        return UIColor(red: CGFloat(r/255), green: CGFloat(g/255), blue: CGFloat(b/255), alpha: 1.0)
    }
    
//    let r:uint = 0x44
//    let g:uint = 0x55
//    let b:uint = 0x66
//    let color:uint = r << 16 | g << 8 | b //0x445566
}
