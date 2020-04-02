//
//  ImageViewController.swift
//  SwiftTry
//
//  Created by Mac on 2020/3/26.
//  Copyright © 2020 AAA. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_534.html
// https://www.hangge.com/blog/cache/detail_710.html
// https://www.hangge.com/blog/cache/detail_803.html
// https://www.hangge.com/blog/cache/detail_804.html
// https://www.hangge.com/blog/cache/detail_805.html
// https://www.hangge.com/blog/cache/detail_889.html
// https://www.hangge.com/blog/cache/detail_900.html
// https://www.hangge.com/blog/cache/detail_902.html
// https://www.hangge.com/blog/cache/detail_904.html
// https://www.hangge.com/blog/cache/detail_906.html
// https://www.hangge.com/blog/cache/detail_907.html
// https://www.hangge.com/blog/cache/detail_914.html
// https://www.hangge.com/blog/cache/detail_909.html【二维码】
// https://www.hangge.com/blog/cache/detail_915.html【二维码扫描】
// https://www.hangge.com/blog/cache/detail_921.html


import UIKit

class ImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let imageView = UIImageView(frame: CGRect(x: 40, y: 200, width: 300, height: 300))
        imageView.image = UIImage(named: "swift")
        imageView.contentMode = .scaleAspectFit
        self.view.addSubview(imageView)
        
        //imageView.image = UIImage(named: "swift")?.tint(color: .systemTeal, blendMode: .destinationIn)
        
        //imageView.image = UIImage(named: "swift")?.waterMarkedImage(waterMarkText: "做最好的开发者知识平台").waterMarkedImage(waterMarkText: "hangge.com", corner: .TopLeft, margin: CGPoint(x: 20, y: 20), waterMarkTextColor: UIColor.red, waterMarkTextFont: UIFont.systemFont(ofSize: 55), backgroundColor: UIColor.clear)
        
        //imageView.image = UIImage(named:"swift")?.sepiaTone()
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

/// 扩展UIImage，添加着色方法
extension UIImage {
    func tint(color: UIColor, blendMode: CGBlendMode) -> UIImage {
        let drawRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.setFill()
        UIRectFill(drawRect)
        draw(in: drawRect, blendMode: blendMode, alpha: 1.0)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return tintedImage
    }
}

/// 通过扩展UIImage类来实现添加水印功能
extension UIImage {
     
    // 水印位置枚举
    enum WaterMarkCorner {
        case TopLeft
        case TopRight
        case BottomLeft
        case BottomRight
    }
     
    // 添加水印方法
    func waterMarkedImage(waterMarkText:String, corner:WaterMarkCorner = .BottomRight,
                          margin:CGPoint = CGPoint(x: 20, y: 20),
                          waterMarkTextColor:UIColor = UIColor.systemBlue,
                          waterMarkTextFont:UIFont = UIFont.systemFont(ofSize: 20),
                          backgroundColor:UIColor = UIColor.clear) -> UIImage {
         
        let textAttributes = [NSAttributedString.Key.foregroundColor:waterMarkTextColor,
                              NSAttributedString.Key.font:waterMarkTextFont,
                              NSAttributedString.Key.backgroundColor:backgroundColor]
        let textSize = NSString(string: waterMarkText).size(withAttributes: textAttributes)
        var textFrame = CGRect(x: 0, y: 0, width: textSize.width, height: textSize.height)
         
        let imageSize = self.size
        switch corner {
            case .TopLeft:
                textFrame.origin = margin
            case .TopRight:
                textFrame.origin = CGPoint(x: imageSize.width - textSize.width - margin.x, y: margin.y)
            case .BottomLeft:
                textFrame.origin = CGPoint(x: margin.x, y: imageSize.height - textSize.height - margin.y)
            case .BottomRight:
                textFrame.origin = CGPoint(x: imageSize.width - textSize.width - margin.x, y: imageSize.height - textSize.height - margin.y)
        }
         
        // 开始给图片添加文字水印
        UIGraphicsBeginImageContext(imageSize)
        self.draw(in: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        NSString(string: waterMarkText).draw(in: textFrame, withAttributes: textAttributes)
         
        let waterMarkedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
         
        return waterMarkedImage
    }
    
    // 添加图片水印方法
    func waterMarkedImage(waterMarkImage:UIImage, corner:WaterMarkCorner = .BottomRight,
                          margin:CGPoint = CGPoint(x: 20, y: 20), alpha:CGFloat = 1) -> UIImage {
         
        var markFrame = CGRect(x:0, y: 0, width:waterMarkImage.size.width, height: waterMarkImage.size.height)
        let imageSize = self.size
         
        switch corner {
            case .TopLeft:
                markFrame.origin = margin
            case .TopRight:
                markFrame.origin = CGPoint(x: imageSize.width - waterMarkImage.size.width - margin.x,
                                           y: margin.y)
            case .BottomLeft:
                markFrame.origin = CGPoint(x: margin.x,
                                           y: imageSize.height - waterMarkImage.size.height - margin.y)
            case .BottomRight:
                markFrame.origin = CGPoint(x: imageSize.width - waterMarkImage.size.width - margin.x,
                                           y: imageSize.height - waterMarkImage.size.height - margin.y)
        }
         
        // 开始给图片添加图片
        UIGraphicsBeginImageContext(imageSize)
        self.draw(in: CGRect(x: 0, y:0, width: imageSize.width, height: imageSize.height))
        waterMarkImage.draw(in: markFrame, blendMode: .normal, alpha: alpha)
        let waterMarkedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
         
        return waterMarkedImage!
    }
}

/// 滤镜
extension UIImage {
    // 棕褐色复古滤镜（老照片效果）
    func sepiaTone() -> UIImage?
    {
        let imageData = self.pngData()
        let inputImage = CoreImage.CIImage(data: imageData!)
        let context = CIContext(options:nil)
        let filter = CIFilter(name:"CISepiaTone")
        filter!.setValue(inputImage, forKey: kCIInputImageKey)
        filter!.setValue(0.8, forKey: "inputIntensity")
        if let outputImage = filter!.outputImage {
            let outImage = context.createCGImage(outputImage, from: outputImage.extent)
            return UIImage(cgImage: outImage!)
        }
        return nil
    }
    
    // 黑白效果滤镜
    func noir() -> UIImage?
    {
        let imageData = self.pngData()
        let inputImage = CoreImage.CIImage(data: imageData!)
        let context = CIContext(options:nil)
        let filter = CIFilter(name:"CIPhotoEffectNoir")
        filter!.setValue(inputImage, forKey: kCIInputImageKey)
        if let outputImage = filter!.outputImage {
            let outImage = context.createCGImage(outputImage, from: outputImage.extent)
            return UIImage(cgImage: outImage!)
        }
        return nil
    }
}
