//
//  AlertViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/27.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_651.html
// https://www.hangge.com/blog/cache/detail_1658.html
// https://www.hangge.com/blog/cache/detail_1657.html


import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        //self.alert()
        
        //self.actionSheet()
        
        //self.input()
        
        //self.hud()
        
        //UIAlertController.showAlert(message: "保存成功!")
        
        UIAlertController.showConfirm(message: "是否提交?") { (_) in
            print("点击了确认按钮!")
        }
    }
    
    func alert() {
        let alert = UIAlertController(title: "提示", message: "你确定要学习 Swift 吗？", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { (action) in
            print("取消")
        }
        let okAction = UIAlertAction(title: "确定", style: .default) { (action) in
            print("确定")
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func actionSheet() {
        let actionSheet = UIAlertController(title: "保存或删除数据", message: "删除数据将不可恢复", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { (action) in
            print("取消")
        }
        let deleteAction = UIAlertAction(title: "删除", style: .destructive) { (action) in
            print("删除")
        }
        let saveAction = UIAlertAction(title: "保存", style: .default) { (action) in
            print("保存")
        }
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(deleteAction)
        actionSheet.addAction(saveAction)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func input() {
        let alert = UIAlertController(title: "系统登录", message: "请输入用户名和密码", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "用户名"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "密码"
            textField.isSecureTextEntry = true
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { (action) in
            print("取消")
        }
        let okAction = UIAlertAction(title: "确定", style: .default) { (action) in
            print("确定")
            
            let user = alert.textFields?[0].text
            let password = alert.textFields?[1].text
            print("用户名：\(user ?? "")")
            print("密码：\(password ?? "")")
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func hud() {
        let alert = UIAlertController(title: "保存成功!", message: nil, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        // 五秒钟后自动消失
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            self.presentedViewController?.dismiss(animated: false, completion: nil)
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

extension UIAlertController {
    // 在指定视图控制器上弹出普通消息提示框
    static func showAlert(message: String, in viewController: UIViewController) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .cancel))
        viewController.present(alert, animated: true)
    }
    
    // 在根视图控制器上弹出普通消息提示框
    static func showAlert(message: String) {
        if let vc = UIApplication.shared.windows.first?.rootViewController {
            showAlert(message: message, in: vc)
        }
    }
    
    // 在指定视图控制器上弹出确认框
    static func showConfirm(message: String, in viewController: UIViewController, confirm: ((UIAlertAction)->Void)?) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "取消", style: .cancel))
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: confirm))
        viewController.present(alert, animated: true)
    }
    
    // 在根视图控制器上弹出确认框
    static func showConfirm(message: String, confirm: ((UIAlertAction)->Void)?) {
        if let vc = UIApplication.shared.windows.first?.rootViewController {
            showConfirm(message: message, in: vc, confirm: confirm)
        }
    }
}
