//
//  RangeViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/24.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_513.html
// https://www.hangge.com/blog/cache/detail_1718.html


import UIKit

class RangeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        /// 闭区间
        for i in 0...10 {
            print(i)
        }
        
        /// 开区间
        for i in 0..<10 {
            print(i)
        }
        
        /// 逆序
        for i in (0..<10).reversed() {
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
