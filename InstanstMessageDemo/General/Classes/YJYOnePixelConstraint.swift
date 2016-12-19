//
//  YJYOnePixelConstraint.swift
//  yuejuanyi
//
//  Created by huangzugang on 16/3/21.
//  Copyright © 2016年 yjtc. All rights reserved.
//

/**

在storyboard中创建1像素的分割线

@IBDesignable
@IBDesignable的宏的功能就是让XCode动态渲染出该类图形化界面。

@IBInspectable
让支持KVC的属性能够在Attribute Inspector中配置。
*/

@IBDesignable
class YJYOnePixelConstraint: NSLayoutConstraint {
    
    fileprivate var _onePixelConstant : Int = 0
    @IBInspectable var onePixelConstant : Int {
        set {
            _onePixelConstant = newValue
            self.constant = (CGFloat(_onePixelConstant) * 1.0) / UIScreen.main.scale
        }
        
        get {
            return _onePixelConstant
        }
    }
}
