//
//  TextFieldViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/26.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_530.html
// https://www.hangge.com/blog/cache/detail_718.html
// https://www.hangge.com/blog/cache/detail_911.html
// https://www.hangge.com/blog/cache/detail_1498.html【解决表格中TextField,TextView编辑时，输入框被键盘遮挡的问题】
// https://www.hangge.com/blog/cache/detail_1610.html【手机号码输入框的实现（手机号验证、格式化显示）】
// https://www.hangge.com/blog/cache/detail_1907.html【限制TextField只能输入中文（附：中文字数的限制）】


import UIKit

class TextFieldViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let textField = UITextField(frame: CGRect(x: 40, y: 100, width: 300, height: 40))
        textField.borderStyle = .roundedRect
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 10.0
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.systemRed.cgColor
        textField.placeholder = "请输入"
        textField.textAlignment = .center
        textField.clearButtonMode = .whileEditing
        textField.isSecureTextEntry = false
        textField.keyboardType = .asciiCapable
        textField.returnKeyType = .done
        textField.delegate = self
        
        self.view.addSubview(textField)
        
        // 监听编辑事件
        textField.addTarget(self, action: #selector(textEditChanged), for: .allEditingEvents)
        
        // 监听文字改变通知
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChanged), name: UITextField.textDidChangeNotification, object: textField)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("111: \(string)")
        return true
    }
    
    @objc func textEditChanged(textField: UITextField) {
        print("222: \(textField.text!)")
    }
    
    @objc func textDidChanged(noti: NSNotification) {
        let textField = noti.object as! UITextField
        print("333: \(textField.text!)")
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
