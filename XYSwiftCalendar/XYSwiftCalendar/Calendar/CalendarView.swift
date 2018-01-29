
//
//  CalendarView.swift
//  XYSwiftCalendar
//
//  Created by 岁变 on 2017/12/8.
//  Copyright © 2017年 岁变. All rights reserved.
//

import UIKit

let WIDTH = UIScreen.main.bounds.width
let HEIGHT = UIScreen.main.bounds.height
let backColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.00)


class CalendarView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let identifier = "pool"
    let headerIdentifier = "header"
    var navi: UINavigationController?
    
    var collection: UICollectionView!
    let mouthArr: Array<String> = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    let yearArr: Array<String> = ["2017", "2016", "2015", "2014", "2013"]

    override init(frame: CGRect) {
        super .init(frame: frame)
        self.setUpUI()
    }
    
    func setUpUI() {
        self.backgroundColor = backColor
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (WIDTH - 25) / 6, height: (WIDTH - 25) / 6)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top:0, left: 5, bottom: 0, right: 5)
        layout.headerReferenceSize = CGSize(width: WIDTH, height: 50)
        
        collection = UICollectionView.init(frame: CGRect.init(x: 0, y: 1, width: WIDTH, height: HEIGHT - 1), collectionViewLayout: layout)
        collection.backgroundColor = UIColor.white
        collection.delegate = self
        collection.dataSource = self
        collection.register(CalendarCollectionCell.self, forCellWithReuseIdentifier: identifier)
        collection.register(CalendarOneHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        self.addSubview(collection)
    }
    
    
    //MARK: collectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CalendarCollectionCell
        cell.mouthLabel.text = mouthArr[indexPath.row] + "月"
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return yearArr.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let reusableView = collection.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! CalendarOneHeader
            reusableView.yearLabel.text = yearArr[indexPath.section] + "年"
            return reusableView
        }
        return UICollectionReusableView()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = CalendarControllerTwo()
        let str = self.yearArr[indexPath.section] + "年" + self.mouthArr[indexPath.row] + "月"
        nextVC.headerText = str
        //处理选中月份的一号日期数据，传到下一页。
        nextVC.currentDate = CalendarDateTool.getCurrentDate(yearStr: yearArr[indexPath.section], mouthStr: mouthArr[indexPath.row])
        self.navi?.pushViewController(nextVC, animated: true)
    }

    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
