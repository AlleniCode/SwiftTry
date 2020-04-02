//
//  AnimationViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/30.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_664.html
// https://www.hangge.com/blog/cache/detail_774.html
// https://www.hangge.com/blog/cache/detail_775.html
// https://www.hangge.com/blog/cache/detail_776.html
// https://www.hangge.com/blog/cache/detail_777.html
// https://www.hangge.com/blog/cache/detail_869.html
// https://www.hangge.com/blog/cache/detail_870.html
// https://www.hangge.com/blog/cache/detail_927.html


import UIKit

class AnimationViewController: UIViewController {
    
    // 游戏方格维度
    var dimension: Int = 4
    
    // 数字格子的宽度
    var width: CGFloat = 50
    
    // 格子与格子的宽度
    var padding: CGFloat = 6
    
    // 保存背景图数据
    var backgrounds: Array<UIView>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        self.backgrounds = Array<UIView>()
        
        self.setupGameMap()
        
        self.playAnimation()
        //self.playAnimation1()
        //self.playAnimation2()
    }
    
    func setupGameMap() {
        var x: CGFloat = 50
        var y: CGFloat = 150
        
        for i in 0..<dimension {
            print(i)
            y = 150
            
            for _ in 0..<dimension {
                let background = UIView(frame: CGRect(x: x, y: y, width: width, height: width))
                background.backgroundColor = .darkGray
                self.view.addSubview(background)
                
                self.backgrounds.append(background)
                y += padding + width
            }
            
            x += padding + width
        }
    }
    
    func playAnimation() {
        for tile in backgrounds {
            // 先将数字块大小置为原始尺寸的 1/10
            tile.layer.setAffineTransform(CGAffineTransform(scaleX: 0.1, y: 0.1))
            
            // 设置动画效果，动画时间长度 1 秒
            UIView.animate(withDuration: 1, delay: 0.01, options: [], animations: {
                // 在动画中，数字块有一个角度的旋转
                tile.layer.setAffineTransform(CGAffineTransform(rotationAngle: 90))
            }) { (finished) in
                UIView.animate(withDuration: 1) {
                    // 完成动画时，数字块复原
                    tile.layer.setAffineTransform(CGAffineTransform.identity)
                }
            }
        }
    }
    
    func playAnimation1() {
        for tile in backgrounds{
            //先将数字块大小置为原始尺寸的 1/10
            tile.layer.setAffineTransform(CGAffineTransform(scaleX: 0.1,y: 0.1))
             
            //设置动画效果，动画时间长度 1 秒。
            UIView.animate(withDuration: 1, delay:0.01, options:[], animations: {
                ()-> Void in
                tile.layer.setAffineTransform(CGAffineTransform(scaleX: 1,y: 1))
            },
            completion:{
                (finished:Bool) -> Void in
                UIView.animate(withDuration: 0.08, animations:{
                    ()-> Void in
                    tile.layer.setAffineTransform(CGAffineTransform.identity)
                })
            })
        }
    }

    func playAnimation2() {
        for tile in backgrounds{
            tile.alpha = 0
             
            //设置动画效果，动画时间长度 1 秒。
            UIView.animate(withDuration: 1, delay:0.01, options:[.curveEaseInOut],
                           animations: {
                            ()-> Void in
            },
            completion:{
                (finished:Bool) -> Void in
                UIView.animate(withDuration: 1, animations:{
                    ()-> Void in
                    tile.alpha = 1
                })
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
