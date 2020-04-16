//
//  SliderViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/26.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_536.html
// https://www.hangge.com/blog/cache/detail_1597.html

import UIKit

class SliderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let slider = UISlider(frame: CGRect(x: 30, y: 0, width: 300, height: 50))
        slider.center = self.view.center
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0.5
        slider.setValue(0.7, animated: true)
        slider.minimumTrackTintColor = .blue
        slider.maximumTrackTintColor = .yellow
        slider.minimumValueImage = UIImage(named:"voice+")
        slider.maximumValueImage = UIImage(named:"voice-")
        slider.isContinuous = false
        slider.addTarget(self, action: #selector(sliderDidChange(_:)), for: .valueChanged)
        self.view.addSubview(slider)
    }
    
    @objc func sliderDidChange(_ slider: UISlider) {
        print(slider.value)
    }
    
    /// 自定义滑块组件图片
    func func1() {
        let slider = UISlider()
        //设置滑块右边部分的图片
        slider.setMaximumTrackImage(UIImage(named:"slider_max"),for: .normal)
        //设置滑块左边部分的图片
        slider.setMinimumTrackImage(UIImage(named:"slider_min"),for: .normal)
        //设置滑块的图片
        slider.setThumbImage(UIImage(named:"slider_thumb"),for: .normal)
        
        //设置滑块右边部分的图片-使用三宫格缩放（左右14像素不变，中间缩放）
        let imgTrackRight = UIImage(named:"slider_max")
        let imgRight = imgTrackRight!.stretchableImage(withLeftCapWidth: 14, topCapHeight:0)
        slider.setMaximumTrackImage(imgRight, for: .normal)
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
