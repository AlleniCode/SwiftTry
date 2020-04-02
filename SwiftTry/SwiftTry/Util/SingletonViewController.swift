//
//  SingletonViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/4/2.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_800.html



import UIKit

class SingletonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        
        let app = AppManager.shareInstance
        print(app)
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

class AppManager {
    static let shareInstance = AppManager()
    
    private init() {} // 私有化init方法
}
