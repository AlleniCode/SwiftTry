//
//  ColorViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/27.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_605.html
// https://www.hangge.com/blog/cache/detail_606.html

import UIKit

class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let color = UIColor(patternImage: UIImage(named: "swift")!)
        self.view.backgroundColor = color
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

extension UIColor {
    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) {
        let red = r / 255.0
        let green = g / 255.0
        let blue = b / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) {
        let red = r / 255.0
        let green = g / 255.0
        let blue = b / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: a)
    }
}
