//
//  ToolbarViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/27.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_551.html
// https://www.hangge.com/blog/cache/detail_1419.html【在数字键盘上添加自定义按钮（增加return键）】

import UIKit

class ToolbarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 50))
        let barButton = UIBarButtonItem(title: "按钮", style: .plain, target: self, action: #selector(barButtonAction))
        let barButtonBack = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAction))
        let barButtonSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        barButtonSpace.width = 100
        barButtonSpace.tintColor = .purple
        toolbar.setItems([barButton, barButtonSpace, barButtonBack], animated: false)
        self.view.addSubview(toolbar)
    }
    
    @objc func barButtonAction() {
        print("按钮被点击")
    }
    
    @objc func cancelAction() {
        print("取消")
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
