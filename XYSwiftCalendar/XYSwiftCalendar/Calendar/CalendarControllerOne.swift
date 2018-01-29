//
//  CalendarControllerOne.swift
//  XYSwiftCalendar
//
//  Created by 岁变 on 2017/12/6.
//  Copyright © 2017年 岁变. All rights reserved.
//

import UIKit



class CalendarControllerOne: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let calendar = CalendarView.init(frame: self.view.bounds)
        calendar.navi = self.navigationController
        self.view.addSubview(calendar)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
