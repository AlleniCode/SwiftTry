//
//  iCloudViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/4/1.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_768.html

import UIKit

class iCloudViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        /**
         对于开发者而言，涉及iCloud存储的功能主要有两个：
         一是 iCloud documnet storage，利用 iCloud 存储用户文件，比如保存一些用户在使用应用时生成的文件以及数据库文件等。
         二是 iCloud key-value data storage，利用 iCloud 存储键值对，主要是保存一些程序的设置信息，一般只允许存储几十K大小。

         注意：要测试iCloud功能，需要一个付费的iOS 开发者账号。 至少要2台iOS设备才可以测试数据同步功能。（iOS Simulator无法做iCloud Storage的测试）
         */
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
