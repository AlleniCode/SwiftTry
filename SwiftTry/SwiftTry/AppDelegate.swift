//
//  AppDelegate.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/23.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_811.html
// https://www.hangge.com/blog/cache/detail_815.html
// https://www.hangge.com/blog/cache/detail_1238.html【延长启动图片的显示时间（LaunchImage）】
// https://www.hangge.com/blog/cache/detail_1247.html【启动画面放大淡出效果的实现】
// https://www.hangge.com/blog/cache/detail_1259.html【企业账号进行IPA的打包、分发、下载安装的详细流程】
// https://www.hangge.com/blog/cache/detail_1358.html【CocoaPods】
// https://www.hangge.com/blog/cache/detail_1359.html【Carthage】
// https://www.hangge.com/blog/cache/detail_1417.html【实现日志输出的封装1（显示出调用的文件名、方法、行号）】
// https://www.hangge.com/blog/cache/detail_1482.html【实现日志输出的封装2（同步记录到文件中去）】
// https://www.hangge.com/blog/cache/detail_1443.html【正确绘制1像素的线条】
// https://www.hangge.com/blog/cache/detail_1521.html【通过UIView对象找到其所在的UIViewController】
// https://www.hangge.com/blog/cache/detail_1517.html【判断是否有某功能访问权限，没有则提示，并自动跳转到设置页】
// https://www.hangge.com/blog/cache/detail_1608.html【检查项目中是否使用了IDFA（附：使用友盟统计时IDFA选项的勾选）】
// https://www.hangge.com/blog/cache/detail_2063.html【判断应用是否是第一次启动（或当前版本是否第一次启动）】
// https://www.hangge.com/blog/cache/detail_2168.html【自定义可重用的代码片段（Code Snippets）】
// https://www.hangge.com/blog/cache/detail_2174.html【实现整体竖屏显示，而部分页面强制横屏（或自动横竖屏）】
// https://www.hangge.com/blog/cache/detail_2257.html【Xcode常用标记介绍（MARK、TODO、FIXME）】


import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

