//
//  ScrollViewViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/26.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_543.html
// https://www.hangge.com/blog/cache/detail_544.html
// https://www.hangge.com/blog/cache/detail_951.html
// https://www.hangge.com/blog/cache/detail_1028.html【侧滑菜单】
// https://www.hangge.com/blog/cache/detail_1035.html【侧滑菜单，仿QQ】
// https://www.hangge.com/blog/cache/detail_1314.html【图片循环轮播组件的实现】
// https://www.hangge.com/blog/cache/detail_1514.html【当存在导航栏时，scrollview自动下移的问题解决】
// https://www.hangge.com/blog/cache/detail_1519.html【edgesForExtendedLayout属性介绍（元素被导航栏遮挡问题）】


import UIKit

class ScrollViewViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let scrollView = UIScrollView(frame: self.view.frame)
        scrollView.delegate = self
        let imageView = UIImageView(image: UIImage(named: "swift"))
        scrollView.contentSize = imageView.bounds.size
        scrollView.addSubview(imageView)
        self.view.addSubview(scrollView)
        
        // 手势放大缩小
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 3
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("x:\(scrollView.contentOffset.x) y:\(scrollView.contentOffset.y)")
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        for subview in scrollView.subviews {
            if subview.isKind(of: UIImageView.self) {
                return subview
            }
        }
        return nil
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
