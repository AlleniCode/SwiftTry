//
//  CalculationViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/30.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_657.html
// https://www.hangge.com/blog/cache/detail_708.html
// https://www.hangge.com/blog/cache/detail_1827.html【高阶函数介绍（map、flatMap、filter、reduce）】
// https://www.hangge.com/blog/cache/detail_1829.html【zip函数使用详解】


import UIKit

class CalculationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        self.quadratic()
        
        // 浮点数转换成整数
        let f = 23.5
        let v1 = Int(f)
        let v2 = lroundf(Float(f))
        let v3 = lround(f)
        print(v1)
        print(v2)
        print(v3)
        
        
        // 取余
        let value1 = 5.5
        let value2 = 2.2
        let result = value1.truncatingRemainder(dividingBy: value2)
        print(result)
    }
    
    /// 2的N次方
    func quadratic() {
        let value1 = 1<<4  //2的4次方
        print(value1)
        
        let value2 = 1<<Int(arc4random_uniform(5))  //2的0~4随机次方（包括0,4）
        print(value2)
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
