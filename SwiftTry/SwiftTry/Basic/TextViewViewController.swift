//
//  TextViewViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/26.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_531.html
// https://www.hangge.com/blog/cache/detail_1104.html
// https://www.hangge.com/blog/cache/detail_1096.html
// https://www.hangge.com/blog/cache/detail_1213.html
// https://www.hangge.com/blog/cache/detail_1498.html【解决表格中TextField,TextView编辑时，输入框被键盘遮挡的问题】
// https://www.hangge.com/blog/cache/detail_1570.html
// https://www.hangge.com/blog/cache/detail_1671.html【修改UITextView中链接的样式（链接颜色、下划线样式）】
// https://www.hangge.com/blog/cache/detail_1751.html


import UIKit

class TextViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let textView = UITextView(frame: CGRect(x: 20, y: 100, width: 300, height: 100))
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.dataDetectorTypes = .all
        self.view.addSubview(textView)
        
        // 自定义选择内容后的菜单
        let mail = UIMenuItem(title: "邮件", action: #selector(TextViewViewController.onMail))
        let weixin = UIMenuItem(title: "微信", action: #selector(onWeixin))
        let menuVC = UIMenuController()
        menuVC.menuItems = [mail, weixin]
    }
    
    @objc func onMail() {
        print("邮件")
    }
    
    @objc func onWeixin() {
        print("微信")
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
