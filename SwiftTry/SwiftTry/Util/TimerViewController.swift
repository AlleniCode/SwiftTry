//
//  TimerViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/30.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_702.html

import UIKit

class TimerViewController: UIViewController {
    
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        var count = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            count += 1
            print(count)
        }
        timer.fire()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        timer?.invalidate()
        timer = nil
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
