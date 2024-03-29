//
//  File.swift
//  XYSwiftCalendar
//
//  Created by 岁变 on 2017/12/6.
//  Copyright © 2017年 岁变. All rights reserved.
//

import UIKit

extension UIColor {
    
    //MARK: 随机赋色
    class func randomColor() -> UIColor {
        var returnColor = UIColor()
        let color1 = UIColor.init(hexString: "#e8eaf2")
        let color2 = UIColor.init(hexString: "#ecefef")
        let color3 = UIColor.init(hexString: "#efefec")
        let color4 = UIColor.init(hexString: "#f6f6f7")
        let colorArr = [color1, color2, color3, color4]
        let temp = Int(arc4random() % 4)
        returnColor = colorArr[temp]
        return returnColor
    }
    
    
    //MARK: 按色号进行赋色
    convenience init(hexString: String) {
        //处理数值
        var cString = hexString.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        let length = (cString as NSString).length
        //错误处理
        if (length < 6 || length > 7 || (!cString.hasPrefix("#") && length == 7)){
            //返回whiteColor
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            return
        }
        
        if cString.hasPrefix("#"){
            cString = (cString as NSString).substring(from: 1)
        }
        
        //字符chuan截取
        var range = NSRange()
        range.location = 0
        range.length = 2
        
        let rString = (cString as NSString).substring(with: range)
        
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        //存储转换后的数值
        var r:UInt32 = 0,g:UInt32 = 0,b:UInt32 = 0
        //进行转换
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        //根据颜色值创建UIColor
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
    
    
}

