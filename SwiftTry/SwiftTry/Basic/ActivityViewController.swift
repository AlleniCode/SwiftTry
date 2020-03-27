//
//  ActivityViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/27.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_641.html

import UIKit

class ActivityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareAction))
    }
    
    @objc func shareAction() {
        let items: [Any] = ["分享的内容", UIImage(named: "swift")!, URL(string: "http://hangge.com")!]
        let acts = [CustomActivity(), WeiXinActivity()]
        let activityView = UIActivityViewController(activityItems: items, applicationActivities: acts)
        // 要排除的分享按钮，不显示在分享框里
        activityView.excludedActivityTypes = [.mail, .copyToPasteboard, .print, .assignToContact, .saveToCameraRoll]
        self.present(activityView, animated: true, completion: nil)
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

class CustomActivity : UIActivity {
    // 用于保存传递过来的要分享的数据
    var text: String!
    var url: URL!
    var image: UIImage!
    
    // 显示在分享框里的名称
    override var activityTitle: String? {
        return "Swift"
    }
    
    // 分享框的图片
    override var activityImage: UIImage? {
        return UIImage(named: "swift")
    }
    
    // 分享类型，在 UIActivityViewController.completionHandler 回调里可以用于判断，一般取当前类名
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType(rawValue: CustomActivity.self.description())
    }
    
    // 按钮类型（分享按钮：在第一行，彩色，动作按钮：在第二行，黑白）
    override class var activityCategory: UIActivity.Category {
        return .action
    }
    
    // 是否显示分享按钮，这里一般根据用户是否授权,或分享内容是否正确等来决定是否要隐藏分享按钮
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        for item in activityItems {
            if item is UIImage {
                return true
            }
            if item is String {
                return true
            }
            if item is URL {
                return true
            }
        }
        return false
    }
    
    // 解析分享数据时调用，可以进行一定的处理
    override func prepare(withActivityItems activityItems: [Any]) {
        for item in activityItems {
            if item is UIImage {
                image = (item as! UIImage)
            }
            if item is String {
                text = item as? String
            }
            if item is URL {
                url = (item as! URL)
            }
        }
    }
    
    // 执行分享行为
    // 这里根据自己的应用做相应的处理
    // 例如你可以分享到另外的app例如微信分享，也可以保存数据到照片或其他地方，甚至分享到网络
    override func perform() {
        // 具体的执行代码这边先省略
        // ......
        activityDidFinish(true)
    }
    
    // 分享时调用
    override var activityViewController: UIViewController? {
        return nil
    }
    
    // 完成分享后调用
    override func activityDidFinish(_ completed: Bool) {
        print("分享完成")
    }
    
}

class WeiXinActivity: UIActivity {
    // 用于保存传递过来的要分享的数据
    var text: String!
    var url: URL!
    var image: UIImage!
    
    // 显示在分享框里的名称
    override var activityTitle: String? {
        return "微信"
    }
    
    // 分享框的图片
    override var activityImage: UIImage? {
        return UIImage(named: "swift")
    }
    
    // 分享类型，在 UIActivityViewController.completionHandler 回调里可以用于判断，一般取当前类名
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType(rawValue: WeiXinActivity.self.description())
    }
    
    // 按钮类型（分享按钮：在第一行，彩色，动作按钮：在第二行，黑白）
    override class var activityCategory: UIActivity.Category {
        return .share
    }
    
    // 是否显示分享按钮，这里一般根据用户是否授权,或分享内容是否正确等来决定是否要隐藏分享按钮
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        for item in activityItems {
            if item is UIImage {
                return true
            }
            if item is String {
                return true
            }
            if item is URL {
                return true
            }
        }
        return false
    }
    
    // 解析分享数据时调用，可以进行一定的处理
    override func prepare(withActivityItems activityItems: [Any]) {
        for item in activityItems {
            if item is UIImage {
                image = (item as! UIImage)
            }
            if item is String {
                text = item as? String
            }
            if item is URL {
                url = (item as! URL)
            }
        }
    }
    
    // 执行分享行为
    // 这里根据自己的应用做相应的处理
    // 例如你可以分享到另外的app例如微信分享，也可以保存数据到照片或其他地方，甚至分享到网络
    override func perform() {
        // 具体的执行代码这边先省略
        // ......
        activityDidFinish(true)
    }
    
    // 分享时调用
    override var activityViewController: UIViewController? {
        return nil
    }
    
    // 完成分享后调用
    override func activityDidFinish(_ completed: Bool) {
        print("分享完成")
    }
}
