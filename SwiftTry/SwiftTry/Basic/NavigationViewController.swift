//
//  NavigationViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/4/3.
//  Copyright © 2020 AAA. All rights reserved.
//

/// Navigation
// https://www.hangge.com/blog/cache/detail_957.html
// https://www.hangge.com/blog/cache/detail_1092.html
// https://www.hangge.com/blog/cache/detail_1093.html
// https://www.hangge.com/blog/cache/detail_962.html
// https://www.hangge.com/blog/cache/detail_963.html
// https://www.hangge.com/blog/cache/detail_964.html
// https://www.hangge.com/blog/cache/detail_1078.html
// https://www.hangge.com/blog/cache/detail_1117.html
// https://www.hangge.com/blog/cache/detail_1164.html
// https://www.hangge.com/blog/cache/detail_1768.html
// https://www.hangge.com/blog/cache/detail_2067.html【导航栏背景全透明效果的实现（沉浸式效果）
// https://www.hangge.com/blog/cache/detail_2068.html【导航栏滑动透明渐变效果的实现（透明度随视图滚动而改变）】
// https://www.hangge.com/blog/cache/detail_2220.html【让navigationBar完全显示指定的颜色（防止导航栏背景色出现误差）】

/// TabBar
// https://www.hangge.com/blog/cache/detail_1002.html
// https://www.hangge.com/blog/cache/detail_1005.html
// https://www.hangge.com/blog/cache/detail_1900.html

/// StatusBar
// https://www.hangge.com/blog/cache/detail_1518.html
// https://www.hangge.com/blog/cache/detail_2272.html【动态改变状态栏statusBar文字颜色（preferredStatusBarStyle无效问题）】



import UIKit

class NavigationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        self.title = "www.hangge.com"
        
        // 修改导航栏背景色
        self.navigationController?.navigationBar.barTintColor =
            UIColor(red: 55/255, green: 186/255, blue: 89/255, alpha: 1)
        
        // 修改导航栏文字颜色
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // 修改导航栏文字字体和大小
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 28)]
        
        // 修改导航栏按钮颜色
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        // 修改导航栏背景图片
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "swift"), for: .default)
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
