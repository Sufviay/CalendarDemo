//
//  CalendarCollectionCell.swift
//  XYSwiftCalendar
//
//  Created by 岁变 on 2017/12/6.
//  Copyright © 2017年 岁变. All rights reserved.
//

import UIKit

class CalendarCollectionCell: UICollectionViewCell {
    
    var picture: UIImageView!
    var mouthLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        picture = UIImageView.init(frame: self.bounds)
        picture.backgroundColor = UIColor.randomColor()
        mouthLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        mouthLabel.center = self.contentView.center
        mouthLabel.textColor = UIColor.white
        mouthLabel.font = UIFont.boldSystemFont(ofSize: 18)
        mouthLabel.textAlignment = NSTextAlignment.center
        configUI()
    }
    
    func configUI() {
        self.contentView.addSubview(picture)
        self.contentView.addSubview(mouthLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
