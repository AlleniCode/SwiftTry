//
//  CoreMotionViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/26.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_545.html
// https://www.hangge.com/blog/cache/detail_1547.html【计步器CMPedometer的使用（获取用户步数、距离、速度等）】
// https://www.hangge.com/blog/cache/detail_1551.html【高度计CMAltimeter的使用（获取设备高度变化值、气压）】
// https://www.hangge.com/blog/cache/detail_1552.html【活动器CMMotionActivityManager的使用（获取当前的运动状态）】
// https://www.hangge.com/blog/cache/detail_1548.html【陀螺仪数据的获取】
// https://www.hangge.com/blog/cache/detail_1550.html【磁力计数据的获取】
// https://www.hangge.com/blog/cache/detail_1544.html【计算运动距离的功能实现（分别基于GPS、计步器）】


import UIKit
import CoreMotion

class CoreMotionViewController: UIViewController, UIAccelerometerDelegate {
    
    var ball: UIImageView!
    var speedX: UIAccelerationValue = 0
    var speedY: UIAccelerationValue = 0
    var motionManager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        //放一个小球在中央
        ball = UIImageView(image:UIImage(named:"swift"))
        ball.frame = CGRect(x:0, y:0, width:50, height:50)
        ball.center = self.view.center
        self.view.addSubview(ball)
         
        motionManager.accelerometerUpdateInterval = 1/60
         
        if motionManager.isAccelerometerAvailable {
            let queue = OperationQueue.current
            motionManager.startAccelerometerUpdates(to: queue!, withHandler: {
                (accelerometerData, error) in
                    //动态设置小球位置
                    self.speedX += accelerometerData!.acceleration.x
                    self.speedY +=  accelerometerData!.acceleration.y
                    var posX=self.ball.center.x + CGFloat(self.speedX)
                    var posY=self.ball.center.y - CGFloat(self.speedY)
                    //碰到边框后的反弹处理
                    if posX<0 {
                        posX=0;
                        //碰到左边的边框后以0.4倍的速度反弹
                        self.speedX *= -0.4
                         
                    }else if posX > self.view.bounds.size.width {
                        posX=self.view.bounds.size.width
                        //碰到右边的边框后以0.4倍的速度反弹
                        self.speedX *= -0.4
                    }
                    if posY<0 {
                        posY=0
                        //碰到上面的边框不反弹
                        self.speedY=0
                    } else if posY>self.view.bounds.size.height{
                        posY=self.view.bounds.size.height
                        //碰到下面的边框以1.5倍的速度反弹
                        self.speedY *= -1.5
                    }
                self.ball.center = CGPoint(x:posX, y:posY)
            })
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
