//
//  ViewController.swift
//  XYSwiftCalendar
//
//  Created by 岁变 on 2017/12/5.
//  Copyright © 2017年 岁变. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()         
        
        let but = UIButton.init(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        but.backgroundColor = UIColor.init(hexString: "#ecefef")
        but.center = self.view.center
        but.setTitle("日历", for: .normal)
        but.setTitleColor(UIColor.black, for: .normal)
        but.addTarget(self, action: #selector(clickBut), for: .touchUpInside)
        self.view.addSubview(but)
    }
    
    @objc func clickBut() {
        
        let nextVC = CalendarControllerOne()
        self.navigationController?.pushViewController(nextVC, animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

