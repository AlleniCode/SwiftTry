//
//  BezierPathViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/4/3.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_938.html
// https://www.hangge.com/blog/cache/detail_939.html
// https://www.hangge.com/blog/cache/detail_941.html
// https://www.hangge.com/blog/cache/detail_942.html
// https://www.hangge.com/blog/cache/detail_1072.html


import UIKit

class BezierPathViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let viewRect = CGRect(x: 50, y: 100, width: 100, height: 100)
        let view = MyCanvas(frame: viewRect)
        self.view.addSubview(view)
        
        let viewRect1 = CGRect(x: 50, y: 250, width: 100, height: 100)
        let view1 = MyCanvas1(frame: viewRect1)
        self.view.addSubview(view1)
        
        let viewRect2 = CGRect(x: 50, y: 400, width: 100, height: 100)
        let view2 = MyCanvas2(frame: viewRect2)
        self.view.addSubview(view2)
        
        let viewRect3 = CGRect(x: 50, y: 550, width: 100, height: 100)
        let view3 = MyCanvas3(frame: viewRect3)
        self.view.addSubview(view3)
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

class MyCanvas: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let pathRect = self.bounds.insetBy(dx: 1, dy: 1)
        let path = UIBezierPath(roundedRect: pathRect, cornerRadius: 10)
        path.lineWidth = 3
        UIColor.green.setFill()
        UIColor.blue.setStroke()
        path.fill()
        path.stroke()
    }
}

class MyCanvas1: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // 创建一个矩形，它的所有边都内缩5%
        let drawingRect = self.bounds.insetBy(dx: self.bounds.size.width * 0.05,
                                              dy: self.bounds.size.height * 0.05)
         
        // 确定组成绘画的点
        let topLeft = CGPoint(x:drawingRect.minX, y: drawingRect.minY)
        let topRight = CGPoint(x:drawingRect.maxX, y:drawingRect.minY)
        let bottomRight = CGPoint(x:drawingRect.maxX, y:drawingRect.maxY)
        let bottomLeft = CGPoint(x:drawingRect.minX, y:drawingRect.maxY)
        let center = CGPoint(x:drawingRect.midX, y:drawingRect.midY)
         
        // 创建一个贝塞尔路径
        let bezierPath = UIBezierPath()
        // 开始绘制
        bezierPath.move(to: topLeft)
        bezierPath.addLine(to: topRight)
        bezierPath.addLine(to: bottomLeft)
        bezierPath.addCurve(to: bottomRight, controlPoint1: center, controlPoint2: center)
        // 使路径闭合，结束绘制
        bezierPath.close()
         
        // 设定颜色，并绘制它们
        UIColor.green.setFill()
        UIColor.black.setStroke()
        bezierPath.fill()
        bezierPath.stroke()
    }
}

class MyCanvas2: UIView {
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 设置背景色为透明，否则是黑色背景
        self.backgroundColor = UIColor.clear
    }
     
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
     
    override func draw(_ rect: CGRect) {
        super.draw(rect)
         
        // 为两个组成部分定义矩形
        let squareRect = self.bounds.insetBy(dx: self.bounds.size.width * 0.05,
                                             dy: self.bounds.size.height * 0.45)
         
        let circleRect = self.bounds.insetBy(dx: self.bounds.size.width * 0.3,
                                             dy: self.bounds.size.height * 0.3)
         
        // 创建一条空Bezier路径作为主路径
        let bezierPath = UIBezierPath()
         
        // 创建子路径
        let circlePath = UIBezierPath(ovalIn: circleRect)
        let squarePath = UIBezierPath(roundedRect: squareRect, cornerRadius: 20)
         
        // 将它们添加到主路径
        bezierPath.append(circlePath)
        bezierPath.append(squarePath)
         
        // 设定颜色，并绘制它们
        UIColor.green.setFill()
        //UIColor.black.setStroke()
        bezierPath.fill()
        //bezierPath.stroke()
    }
}

class MyCanvas3: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 把背景色设为透明
        self.backgroundColor = UIColor.clear
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    override func draw(_ rect: CGRect) {
        // 获取绘制上下文
        let context = UIGraphicsGetCurrentContext()
         
        // 计算要在其中绘制的矩形
        let pathRect = self.bounds.insetBy(dx:self.bounds.size.width * 0.1, dy:self.bounds.size.height * 0.1)
         
        // 创建一个圆角矩形路径
        let rectanglePath = UIBezierPath(roundedRect: pathRect, cornerRadius: 20)
         
        // 保存绘制设置
        context!.saveGState()
         
        // 准备阴影
        let shadowColor = UIColor.black.cgColor
        let shadowOffet = CGSize(width: 3, height: 3)
        let shadowBlurRadius:CGFloat = 5.0
         
        // 创建和应用阴影
        context!.setShadow(offset: shadowOffet, blur: shadowBlurRadius, color: shadowColor)
         
        // 绘制带有阴影的路径
        UIColor.blue.setFill()
        rectanglePath.fill()
         
        // 还原绘制设置
        context!.restoreGState()
         
        //绘制另一个矩形（不带阴影）
        let pathRect2 = self.bounds.insetBy(dx: self.bounds.size.width * 0.3,
                                            dy: self.bounds.size.height * 0.3)
        let rectanglePath2 = UIBezierPath(rect: pathRect2)
        UIColor.yellow.setFill()
        rectanglePath2.fill()
    }
}

