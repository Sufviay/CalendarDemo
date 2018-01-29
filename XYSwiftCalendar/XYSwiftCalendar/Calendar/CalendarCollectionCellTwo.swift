//
//  CalendarCollectionCellTwo.swift
//  XYSwiftCalendar
//
//  Created by 岁变 on 2017/12/7.
//  Copyright © 2017年 岁变. All rights reserved.
//

import UIKit

class CalendarCollectionCellTwo: UICollectionViewCell {
    var picture: UIImageView!
    var dayLabel: UILabel!
    
    var cellDate = Date() {
        didSet {
            //判断是否为同一月份
            if CalendarDateTool.checkSameMouth(dateOne: cellDate, dateTwo: currentDate) {
                showDate()
            } else {
                showSpace()
            }
        }
    }
    var currentDate: Date!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        picture = UIImageView.init(frame: self.bounds)
        dayLabel = UILabel.init(frame: CGRect(x: self.frame.width - 25, y: self.frame.height - 25, width: 20, height: 20 ))
        dayLabel.textColor = UIColor.white
        dayLabel.font = UIFont.boldSystemFont(ofSize: 12)
        dayLabel.textAlignment = NSTextAlignment.center
        configUI()
    }
    
    func configUI() {
        self.contentView.addSubview(picture)
        self.contentView.addSubview(dayLabel)
    }
    
    //当cell的日期该月份为同月时正常显示cell的样式
    func showDate() {
        self.isUserInteractionEnabled = true
        picture.backgroundColor = UIColor.randomColor()
        let day = CalendarDateTool.shared().getCellDateStrFromFormat(formatStr: "dd", cellDate: cellDate)
        dayLabel.text = day
        
    }
    
    //当不属于同一个月时，显示空白
    func showSpace() {
        self.isUserInteractionEnabled = false
        picture.backgroundColor = UIColor.clear
        dayLabel.text = ""
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
