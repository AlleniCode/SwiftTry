//
//  SegmentViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/26.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_533.html

import UIKit

class SegmentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let segment = UISegmentedControl(items: ["选项一", "选项二", "选项三"])
        segment.center = self.view.center
        segment.selectedSegmentIndex = 1
        segment.tintColor = .red
        segment.setContentOffset(CGSize(width: 10, height: 10), forSegmentAt: 1)
        segment.addTarget(self, action: #selector(segmentDidChange(_:)), for: .valueChanged)
        self.view.addSubview(segment)
    }
    
    @objc func segmentDidChange(_ segment: UISegmentedControl) {
        print(segment.selectedSegmentIndex)
        print(segment.titleForSegment(at: segment.selectedSegmentIndex)!)
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
