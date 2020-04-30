//
//  OptionalViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/4/28.
//  Copyright © 2020 AAA. All rights reserved.
//

import UIKit

class OptionalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        testEnum()
        testIfLet()
        testWhileLet()
    }
    
    /// 通过枚举解决魔法数的问题
    func testEnum() {
        var array = ["One", "Two", "Three"]
        switch array.firstIndex(of: "Four") {
        case .some(let index):
            array.remove(at: index)
        case .none:
            break
        }
    }
    
    /// 使用 if let 来进行可选值绑定
    func testIfLet() {
        var array = ["One", "Two", "Three"]
        if let index = array.firstIndex(of: "Four") {
            array.remove(at: index)
        }
        
        // 可以在一个 if 语句中绑定多个值
        let urlStr = "https://www.objc.io/logo.png"
        if let url = URL(string: urlStr),
           let data = try? Data(contentsOf: url),
           let image = UIImage(data: data)
        {
            let imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
            imageView.image = image
            self.view.addSubview(imageView)
        }
    }
    
    /// while let
    func testWhileLet() {
        let array = [1, 2, 3]
        var iterator = array.makeIterator()
        while let i = iterator.next() {
            print(i)
        }
        
        for i in 0...10 where i % 2 == 0 {
            print(i)
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
