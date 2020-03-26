//
//  LabelViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/26.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_528.html

import UIKit

class LabelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 40))
        label.text = "Swift Try"
        label.textColor = .red
        label.backgroundColor = .systemYellow
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        //label.shadowColor = .gray
        //label.shadowOffset = CGSize(width: 2, height: 2)
        self.view.addSubview(label)
        
        // 富文本
        let attributeString = NSMutableAttributedString(string: "Swift Try ABC")
        attributeString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 30), range: NSMakeRange(0, 5))
        attributeString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: NSMakeRange(6, 3))
        attributeString.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.green, range: NSMakeRange(10, 3))
        label.attributedText = attributeString
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
