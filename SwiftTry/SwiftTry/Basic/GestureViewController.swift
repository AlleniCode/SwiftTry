//
//  GestureViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/26.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_546.html
// https://www.hangge.com/blog/cache/detail_674.html

import UIKit

class GestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        self.func1()
        
        self.func2()
        
        self.func3()
        
        self.func4()
        
        self.func5()
        
        self.func6()
        
        self.func7()
    }
    
    /// UISwipeGestureRecognizer：滑动（快速移动）
    func func1() {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipe(_:)))
        swipe.direction = .up
        self.view.addGestureRecognizer(swipe)
    }
    
    @objc func swipe(_ gesture: UISwipeGestureRecognizer) {
        let point = gesture.location(in: self.view)
        print(point.x)
        print(point.y)
    }
    
    
    /// UIScreenEdgePanGestureRecognizer：边缘滑动
    func func2() {
        let pan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(edgePan(_:)))
        pan.edges = .left
        self.view.addGestureRecognizer(pan)
    }
    
    @objc func edgePan(_ gesture: UIScreenEdgePanGestureRecognizer) {
        let point = gesture.location(in: self.view)
        print(point.x)
        print(point.y)
    }
    
    
    /// UITapGestureRecognizer：轻点手势（点击）
    func func3() {
        let tapSingle = UITapGestureRecognizer(target: self, action: #selector(tapSingle(_:)))
        tapSingle.numberOfTapsRequired = 1
        tapSingle.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(tapSingle)
        
        let tapDouble = UITapGestureRecognizer(target: self, action: #selector(tapDouble(_:)))
        tapDouble.numberOfTapsRequired = 2
        tapDouble.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(tapDouble)
        
        // 声明点击事件需要双击事件检测失败后才会执行
        tapSingle.require(toFail: tapDouble)
    }
    
    @objc func tapSingle(_ gesture: UITapGestureRecognizer) {
        print("单击了")
    }
    
    @objc func tapDouble(_ gesture: UITapGestureRecognizer) {
        print("双击了")
    }
    
    
    /// UIPinchGestureRecognizer：捏合手势（两个手指进行放大缩小）
    func func4() {
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func pinch(_ gesture: UIPinchGestureRecognizer) {
        //在监听方法中可以实时获得捏合的比例
        print(gesture.scale)
        //获取两个触摸点的坐标
        print(gesture.location(ofTouch: 0, in: self.view))
        print(gesture.location(ofTouch: 1, in: self.view))
    }
    
    
    /// UIRotationGestureRecognizer：旋转手势（两个手指进行旋转）
    func func5() {
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(rotate(_:)))
        self.view.addGestureRecognizer(rotation)
    }
    
    @objc func rotate(_ gesture: UIRotationGestureRecognizer) {
        // 旋转的弧度转换为角度
        print("旋转：\(gesture.rotation*(180/CGFloat.pi))")
    }
    
    
    /// UIPanGestureRecognizer：拖动手势
    func func6() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(pan(_:)))
        pan.maximumNumberOfTouches = 1
        self.view.addGestureRecognizer(pan)
    }
    
    @objc func pan(_ gesture: UIPanGestureRecognizer) {
        let point = gesture.location(in: self.view)
        print(point)
    }
    
    
    /// UILongPressGestureRecognizer：长按
    func func7() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
        self.view.addGestureRecognizer(longPress)
    }
    
    @objc func longPress(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            print("长按响应开始")
        } else {
            print("长按响应结束")
        }
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
