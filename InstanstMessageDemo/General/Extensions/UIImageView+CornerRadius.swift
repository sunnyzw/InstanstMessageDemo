//
//  UIImageView+CornerRadius.swift
//  yuejuanyi
//
//  Created by sunzhiwei on 16/4/6.
//  Copyright © 2016年 yjtc. All rights reserved.
//

import UIKit

// 设置图片圆角扩展
extension UIImageView {
    
    /**
     * 设置圆形的图片
     * param: urlStr            网络图片地址
     * param: placeholderStr    占位图片名称
     * param: radius            圆角半径
     */
    func setImageOfRound(urlStr: String, placeholderStr: String, radius: CGFloat) {
        
        self.sd_setImage(with: URL(string: urlStr), placeholderImage: UIImage(named: placeholderStr), options: SDWebImageOptions.lowPriority){ (image, error, cacheType, url) in
            self.corner(radius: radius)
        }
    }
    
    /**
     * param: radius            圆角半径
     * 注意：只有当imageView.image 不为nil 时，调用此方法才有效果
     */
    // 设置圆角 默认设置全部角
    func corner(radius: CGFloat, cornerType: UIRectCorner = .allCorners, borderWidth: CGFloat = 0, borderColor: UIColor? = nil) {
        
        // 开始图形上下文
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        // 获得图形上下文
        let ctx = UIGraphicsGetCurrentContext()
        if ctx == nil {
            return
        }
        // 圆角路径
        let cornerPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: cornerType, cornerRadii: CGSize(width: radius, height: radius))
        // 裁剪
        cornerPath.addClip()
        // 渲染上下文
        self.layer.render(in: ctx!)
        // 边框
        if borderWidth != 0 && borderColor != nil {
            cornerPath.lineWidth = borderWidth*2
            borderColor?.setStroke()
            cornerPath.stroke()
        }
        // 从上下文上获取剪裁后的照片
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        // 关闭上下文
        UIGraphicsEndImageContext()
        self.image = newImage
    }
    
    // 拉伸图片
    func stretchImage(imageName: String) {
        
        let image   = UIImage(named: imageName)!
        let edge    = UIEdgeInsetsMake(0, image.size.width/2, 0, image.size.width/2)
        self.image  = image.resizableImage(withCapInsets: edge, resizingMode: .stretch)
    }
}

// UIImage扩展
extension UIImage {
    
    // 图片拼接
    func appendImages(_ images: [UIImage]) -> UIImage {
        
        // 切片最大的宽度
        var maxWidth = images[0].size.width
        // 切片总高
        var totalHeight : CGFloat = 0
        for i in 0 ..< images.count {
            let imageSize = images[i].size
            if imageSize.width > maxWidth {
                maxWidth = imageSize.width
            }
            totalHeight += imageSize.height
        }
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: maxWidth, height: totalHeight), false, UIScreen.main.scale)
        
        var resultImage : UIImage!
        var y : CGFloat = 0
        
        for i in 0 ..< images.count {
            let image = images[i]
            image.draw(in: CGRect(x: 0, y: y, width: image.size.width, height: image.size.height))
            y += image.size.height
        }
        resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resultImage
    }
    
    // 图片上画矩形
    func drawRectangle(rect: CGRect) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.setStrokeColor(UIColor.red.cgColor)
        ctx?.setLineWidth(3)
        ctx?.addRect(rect)
        ctx?.drawPath(using: .stroke)
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resultImage!
    }
}


