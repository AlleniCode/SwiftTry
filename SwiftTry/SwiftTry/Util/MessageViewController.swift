//
//  MessageViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/4/2.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_791.html


import UIKit
import MessageUI


class MessageViewController: UIViewController, UINavigationControllerDelegate, MFMessageComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        // 首先要判断设备具不具备发送短信功能
        if MFMessageComposeViewController.canSendText() {
            let vc = MFMessageComposeViewController()
            // 设置短信内容
            vc.body = "短信内容：欢迎来到 hangge.com"
            // 设置收件人列表
            vc.recipients = ["12345", "67890"]
            // 设置代理
            vc.messageComposeDelegate = self
            // 打开界面
            self.present(vc, animated: true) {
                
            }
        } else {
            print("本设备不能发送短信")
        }
    }
    
    // 发送短信代理
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
        switch result {
            case .sent:
                print("短信已发送")
            case .cancelled:
                print("短信取消发送")
            case .failed:
                print("短信发送失败")
            default:
                break
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
