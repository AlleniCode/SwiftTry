//
//  ImageViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/26.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_534.html
// https://www.hangge.com/blog/cache/detail_710.html

import UIKit

class ImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let imageView = UIImageView(frame: CGRect(x: 40, y: 200, width: 300, height: 300))
        imageView.image = UIImage(named: "swift")
        imageView.contentMode = .scaleAspectFit
        self.view.addSubview(imageView)
    }
    
    /// 从文件目录中获取图片
    func func1() {
        let path = Bundle.main.path(forResource: "swift", ofType: "png")
        let image = UIImage(contentsOfFile: path ?? "")
        let imageView = UIImageView(image: image)
        self.view.addSubview(imageView)
    }
    
    /// 从网络地址获取图片
    func func2() {
        let url = URL(string: "http://hangge.com/blog/images/logo.png")
        let data = try! Data(contentsOf: url!)
        let image = UIImage(data: data)
        let imageView = UIImageView(image: image)
        self.view.addSubview(imageView)
    }
    
    /// 使用图像控件实现动画播放
    func func3() {
        let imageView = UIImageView()
        imageView.frame=CGRect(x:20, y:20, width:100, height:100)
        imageView.animationImages = [UIImage(named:"icon1")!, UIImage(named:"icon2")!]
        imageView.animationDuration = 0.5
        self.view.addSubview(imageView)
        
        imageView.startAnimating()
        sleep(10)
        imageView.stopAnimating()
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
