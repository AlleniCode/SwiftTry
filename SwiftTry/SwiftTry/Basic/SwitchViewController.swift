//
//  SwitchViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/26.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_532.html

import UIKit

class SwitchViewController: UIViewController {
    
    var switchS: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        self.switchS = UISwitch()
        self.switchS.center = CGPoint(x: 100, y: 200)
        self.switchS.isOn = true
        self.switchS.addTarget(self, action: #selector(switchAction), for: .valueChanged)
        self.view.addSubview(self.switchS)
    }
    
    @objc func switchAction() {
        print(self.switchS.isOn)
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
