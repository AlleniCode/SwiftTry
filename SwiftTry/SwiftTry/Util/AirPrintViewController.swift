//
//  AirPrintViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/4/3.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_937.html
// https://developer.apple.com/download/more/  【Hardware IO Tools】
// https://www.hangge.com/blog/cache/detail_1130.html
// https://www.hangge.com/blog/cache/detail_1124.html


import UIKit

class AirPrintViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.airPrint()
    }
    
    func airPrint() {
        let printVC = UIPrintInteractionController()
        
        // 打印任务相关信息
        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.outputType = .general
        printInfo.jobName = "My print job"
        printVC.printInfo = printInfo
        
        // 设置打印文本
        let printText = "<div style='font-size:28px;font-weight:bold;text-align:center'>"
        + "hangge.com</div>"
        + "做最好的开发者知识平台"
        
        // 格式化f打印文本
        let formatter = UIMarkupTextPrintFormatter(markupText: printText)
        printVC.printFormatter = formatter
        
        // 提供打印界面让用户选择打印机和副本的数量
        printVC.present(animated: true) { (vc, success, error) in
            if !success {
                print(error!)
            }
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
