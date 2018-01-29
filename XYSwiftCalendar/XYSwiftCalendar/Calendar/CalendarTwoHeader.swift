//
//  CalendarTwoHeader.swift
//  XYSwiftCalendar
//
//  Created by 岁变 on 2017/12/7.
//  Copyright © 2017年 岁变. All rights reserved.
//

import UIKit

class CalendarTwoHeader: UICollectionReusableView {
    let labelWidth: CGFloat = (WIDTH - 6) / 7
    let labelHeight: CGFloat = 15
    var yearLabel: UILabel!
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        yearLabel = UILabel.init(frame: CGRect(x: 18, y: 15, width: self.frame.width - 40, height: 15))
        yearLabel.textAlignment = NSTextAlignment.left
        yearLabel.font = UIFont.systemFont(ofSize: 15)
        yearLabel.textColor = UIColor.black
        self.addSubview(yearLabel)
        
        let label1 = UILabel.init(frame: CGRect.init(x: 0, y: yearLabel.frame.maxY + 10, width: labelWidth, height: labelHeight))
        label1.text = "周日"
        label1.textAlignment = NSTextAlignment.center
        label1.font = UIFont.systemFont(ofSize: 10)
        label1.textColor = UIColor.init(hexString: "#959595")
        
        let label2 = UILabel.init(frame: CGRect.init(x: label1.frame.maxX + 1, y: label1.frame.minY, width: labelWidth, height: labelHeight))
        label2.text = "周一"
        label2.textAlignment = NSTextAlignment.center
        label2.font = UIFont.systemFont(ofSize: 10)
        label2.textColor = UIColor.init(hexString: "#959595")
        
        let label3 = UILabel.init(frame: CGRect.init(x: label2.frame.maxX + 1, y: label1.frame.minY, width: labelWidth, height: labelHeight))
        label3.text = "周二"
        label3.textAlignment = NSTextAlignment.center
        label3.font = UIFont.systemFont(ofSize: 10)
        label3.textColor = UIColor.init(hexString: "#959595")
        
        let label4 = UILabel.init(frame: CGRect.init(x: label3.frame.maxX + 1, y: label1.frame.minY, width: labelWidth, height: labelHeight))
        label4.text = "周三"
        label4.textAlignment = NSTextAlignment.center
        label4.font = UIFont.systemFont(ofSize: 10)
        label4.textColor = UIColor.init(hexString: "#959595")
        
        let label5 = UILabel.init(frame: CGRect.init(x: label4.frame.maxX + 1, y: label1.frame.minY, width: labelWidth, height: labelHeight))
        label5.text = "周四"
        label5.textAlignment = NSTextAlignment.center
        label5.font = UIFont.systemFont(ofSize: 10)
        label5.textColor = UIColor.init(hexString: "#959595")

        let label6 = UILabel.init(frame: CGRect.init(x: label5.frame.maxX + 1, y: label1.frame.minY, width: labelWidth, height: labelHeight))
        label6.text = "周五"
        label6.textAlignment = NSTextAlignment.center
        label6.font = UIFont.systemFont(ofSize: 10)
        label6.textColor = UIColor.init(hexString: "#959595")

        let label7 = UILabel.init(frame: CGRect.init(x: label6.frame.maxX + 1, y: label1.frame.minY, width: labelWidth, height: labelHeight))
        label7.text = "周六"
        label7.textAlignment = NSTextAlignment.center
        label7.font = UIFont.systemFont(ofSize: 10)
        label7.textColor = UIColor.init(hexString: "#959595")
        
        self.addSubview(label1)
        self.addSubview(label2)
        self.addSubview(label3)
        self.addSubview(label4)
        self.addSubview(label5)
        self.addSubview(label6)
        self.addSubview(label7)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
