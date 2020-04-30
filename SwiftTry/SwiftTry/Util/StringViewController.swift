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
// https://www.hangge.com/blog/cache/detail_961.html
// https://www.hangge.com/blog/cache/detail_1206.html
// https://www.hangge.com/blog/cache/detail_1584.html
// https://www.hangge.com/blog/cache/detail_1585.html
// https://www.hangge.com/blog/cache/detail_1583.html【实现URL字符串的编码与解码（urlEncoded、urlDecoded）】
// https://www.hangge.com/blog/cache/detail_1649.html
// https://www.hangge.com/blog/cache/detail_1647.html
// https://www.hangge.com/blog/cache/detail_2086.html【使用NumberFormatter进行数字格式化显示】


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
        
        self.stringToArray()
        
        testFileExtension()
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
    
    /// 将字符串拆分成数组（把一个字符串分割成字符串数组）
    func stringToArray() {
        let str = "北京、上海、深圳、香港"
        print("原始字符串：\(str)")
         
        let splitedArray = str.components(separatedBy: "、")
        print("拆分后的数组：\(splitedArray)")
        
        let splitedArray1 = str.split{$0 == "、"}.map(String.init)
        print("拆分后的数组：\(splitedArray1)")
    }
    
    /// 在字符串中查找另一字符串首次出现的位置（或最后一次出现位置）
    func position() {
        let str1 = "欢迎访问hangge.com。hangge.com做最好的开发者知识平台"
        let str2 = "hangge"
        print("父字符串：\(str1)")
        print("子字符串：\(str2)")
         
        let position1 = str1.positionOf(sub: str2)
        print("子字符串第一次出现的位置是：\(position1)")
        let position2 = str1.positionOf(sub: str2, backwards: true)
        print("子字符串最后一次出现的位置是：\(position2)")
    }
    
    func testSubString() {
        let str1 = "欢迎访问hangge.com"
        let str2 = str1.subString(start: 4, length: 6)
        print("原字符串：\(str1)")
        print("截取出的字符串：\(str2)")
    }
    
    func testURL() {
        let urlStr = "http://hanggge.com?name=航歌&key=!*'();:@&=+$,/?%#[]"
        print("转义后的url：\(urlStr.urlEncoded())")
        print("还原后的url：\(urlStr.urlEncoded().urlDecoded())")
    }
    
    func testTrim() {
        
        //原始字符串
        let str1 = "   欢迎访问 hangge.com   "
        //除去前后空格
        let str2 = str1.trimmingCharacters(in: .whitespaces)
         
        //打印结果
        print("原字符串：\(str1)")
        print("新字符串：\(str2)")
        
        //原始字符串
        let str3 = "<<hangge.com>>"
        //删除前后<>
        let characterSet = CharacterSet(charactersIn: "<>")
        let str4 = str3.trimmingCharacters(in: characterSet)
         
        //打印结果
        print("原字符串：\(str3)")
        print("新字符串：\(str4)")
    }
    
    func testReplace() {
        //原始字符串
        let str1 = "欢迎🆚访问💓😄hangge.com"
        //判断表情的正则表达式
        let pattern = "[\\ud83c\\udc00-\\ud83c\\udfff]|[\\ud83d\\udc00-\\ud83d\\udfff]|[\\u2600-\\u27ff]"
        //替换后的字符串
        let str2 = str1.pregReplace(pattern: pattern, with: "")
        //打印结果
        print("原字符串：\(str1)")
        print("新字符串：\(str2)")
    }
    
    func testFileExtension() {
        let file = "swift.png"
        print(file.fileExtension ?? "")
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

extension String {
    // 返回第一次出现的指定子字符串在此字符串中的索引
    //（如果backwards参数设置为true，则返回最后出现的位置）
    func positionOf(sub:String, backwards:Bool = false)->Int {
        var pos = -1
        if let range = range(of:sub, options: backwards ? .backwards : .literal ) {
            if !range.isEmpty {
                pos = self.distance(from:startIndex, to:range.lowerBound)
            }
        }
        return pos
    }
}

extension String {
    // 根据开始位置和长度截取字符串
    func subString(start:Int, length:Int = -1) -> String {
        var len = length
        if len == -1 {
            len = self.count - start
        }
        let st = self.index(startIndex, offsetBy:start)
        let en = self.index(st, offsetBy:len)
        return String(self[st ..< en])
    }
}

extension String {
    // 将原始的url编码为合法的url
    func urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
     
    //将编码后的url转换回原始的url
    func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
    }
}

/// 使用正则表达式替换
extension String {
    //返回字数
    var count: Int {
        let string_NS = self as NSString
        return string_NS.length
    }
     
    //使用正则表达式替换
    func pregReplace(pattern: String, with: String,
                     options: NSRegularExpression.Options = []) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        return regex.stringByReplacingMatches(in: self, options: [],
                                              range: NSMakeRange(0, self.count),
                                              withTemplate: with)
    }
}


extension String {
    // 判断是否是整数
    func isInt() -> Bool {
        let scan: Scanner = Scanner(string: self)
        var val: Int = 0
        let result = scan.scanInt(&val) && scan.isAtEnd
        return result
    }
    
    // 判断是否是 Float
    func isFloat() -> Bool {
        let scan: Scanner = Scanner(string: self)
        var val: Float = 0
        let result = scan.scanFloat(&val) && scan.isAtEnd
        return result
    }
}


extension String {
    var fileExtension: String? {
        guard let period = lastIndex(of: ".") else {
            return nil
        }
        let extensionStart = index(after: period)
        let result = String(self[extensionStart...])
        return result
    }
}
