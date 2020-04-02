//
//  RegexViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/4/2.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_799.html
// https://www.hangge.com/blog/cache/detail_2170.html


/**
 用户名验证（允许使用小写字母、数字、下滑线、横杠，一共3~16个字符）
 ^[a-z0-9_-]{3,16}$
  
 Email验证
 ^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$
  
 手机号码验证
 ^1[0-9]{10}$
  
 URL验证
 ^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$
  
 IP地址验证
 ^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$
  
 html标签验证
 ^<([a-z]+)([^<]+)*(?:>(.*)<\/\1>|\s+\/>)$
 */

import UIKit

class RegexViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        
        let mailPattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        let matcher = MyRegex(mailPattern)
        let maybeMailAddress = "admin@hangge.com"
        if matcher.match(input: maybeMailAddress) {
            print("邮箱地址格式正确")
        } else {
            print("邮箱地址格式有误")
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

struct MyRegex {
    let regex: NSRegularExpression?
    
    init(_ pattern: String) {
        regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    
    func match(input: String) -> Bool {
        if let matches = regex?.matches(in: input, options: [], range: NSMakeRange(0, input.count)) {
            return matches.count > 0
        } else {
            return false
        }
    }
}



