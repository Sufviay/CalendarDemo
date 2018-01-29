//
//  CalendarControllerTwo.swift
//  XYSwiftCalendar
//
//  Created by 岁变 on 2017/12/6.
//  Copyright © 2017年 岁变. All rights reserved.
//

import UIKit

class CalendarControllerTwo: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    let identifier = "pool"
    let headerIdentifier = "header"
    
    var collection: UICollectionView!
    var headerText: String!  //头视图的字符串
    var currentDate: Date!   //选中的月份的一号日期（Data）数据
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    
    func setUpUI() {
        self.view.backgroundColor = backColor
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (WIDTH - 6) / 7, height: (WIDTH - 6) / 7)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        layout.headerReferenceSize = CGSize(width: WIDTH, height: 60)
        
        collection = UICollectionView.init(frame: CGRect.init(x: 0, y: 1, width: WIDTH, height: HEIGHT - 1), collectionViewLayout: layout)
        collection.backgroundColor = UIColor.white
        collection.delegate = self
        collection.dataSource = self
        collection.register(CalendarCollectionCellTwo.self, forCellWithReuseIdentifier: identifier)
        collection.register(CalendarTwoHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        self.view.addSubview(collection)
        
    }
    
    //MARK: collectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let reusableView = collection.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! CalendarTwoHeader
            reusableView.yearLabel.text = headerText
            return reusableView
        }
        return UICollectionReusableView()
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //获取该月份返回cell的个数方法
        return CalendarDateTool.calendarGetRows(currentDate: currentDate) * 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CalendarCollectionCellTwo
        let cellDate = CalendarDateTool.dateForCell(indexPath: indexPath, currentDate: currentDate)
        cell.currentDate = currentDate
        cell.cellDate = cellDate
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
