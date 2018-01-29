//
//  CalendarOneHeader.swift
//  XYSwiftCalendar
//
//  Created by 岁变 on 2017/12/6.
//  Copyright © 2017年 岁变. All rights reserved.
//

import UIKit

class CalendarOneHeader: UICollectionReusableView {
    
    var yearLabel: UILabel!
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        yearLabel = UILabel.init(frame: CGRect(x: 18, y: 20, width: self.frame.width - 40, height: 18))
        yearLabel.textAlignment = NSTextAlignment.left
        yearLabel.font = UIFont.systemFont(ofSize: 13)
        yearLabel.textColor = UIColor.gray
        self.addSubview(yearLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
