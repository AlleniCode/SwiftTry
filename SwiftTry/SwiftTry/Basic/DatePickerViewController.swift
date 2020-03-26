//
//  DatePickerViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/26.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_547.html
// https://www.hangge.com/blog/cache/detail_548.html

import UIKit

class DatePickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
        datePicker.center = self.view.center
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "zh_CN")
        datePicker.setValue(UIColor.green, forKey: "textColor") // 修改文字颜色
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        self.view.addSubview(datePicker)
        
        
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        print(formatter.string(from: datePicker.date))
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
