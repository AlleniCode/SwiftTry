//
//  StepperViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/26.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_542.html

import UIKit

class StepperViewController: UIViewController {
    
    var stepper: UIStepper!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        self.stepper = UIStepper()
        self.stepper.center = self.view.center
        self.stepper.minimumValue = 0
        self.stepper.maximumValue = 100
        self.stepper.value = 10
        self.stepper.stepValue = 5
        self.stepper.isContinuous = true
        self.stepper.wraps = false
        self.stepper.addTarget(self, action: #selector(stepperValeChanged), for: .valueChanged)
        self.view.addSubview(self.stepper)
    }
    
    @objc func stepperValeChanged() {
        print(self.stepper.value)
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
