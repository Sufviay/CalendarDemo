
//
//  CalendarDateTool.swift
//  XYSwiftCalendar
//
//  Created by 岁变 on 2017/12/7.
//  Copyright © 2017年 岁变. All rights reserved.
//

import UIKit

class CalendarDateTool: NSObject {
    
    let formate = DateFormatter()
    
    static let instance: CalendarDateTool = CalendarDateTool()
    class func shared() -> CalendarDateTool {
        return instance
    }
    
    //MARK: 日历显示行数
    class func calendarGetRows(currentDate: Date) -> Int {
        //当前日期（都是每月的1号）是星期几 （默认是周日为1，周一为2，依次类推）
        let week: Int = Calendar.current.ordinality(of: .day, in: .weekOfMonth, for: currentDate) ?? 0
        //当前月的天数
        let daysOfMouth: Int = Calendar.current.range(of: .day, in: .month, for: currentDate)?.count ?? 0
        //进行行数的计算，需理解。
        let temp = daysOfMouth - (8 - week)
        let rows = temp % 7 > 0 ? temp / 7 + 2 : temp / 7 + 1
        return rows
    }
    
    //MARK: 获取选中月份第一天的日期Date
    class func getCurrentDate(yearStr: String, mouthStr: String) -> Date {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        let str = yearStr + "-" + mouthStr + "-" + "01"
        let date = dateFormat.date(from: str)
        return date!
    }
    
    
    //MARK:获取cell的日期 按照indexPath获取cell的日期
    class func dateForCell(indexPath: IndexPath, currentDate: Date) -> Date {
        let week: Int = Calendar.current.ordinality(of: .day, in: .weekOfMonth, for: currentDate) ?? 0
        var dateComponents = DateComponents()
        dateComponents.day = (1 - week) + indexPath.row
        let date: Date = Calendar.current.date(byAdding: dateComponents, to: currentDate)!
        return date
    }
    
    //MARK: 判断两个日期月份是否同一个月
    class func checkSameMouth(dateOne: Date, dateTwo: Date) -> Bool {
        let cal = Calendar.current
        let yearOne: Int = cal.component(.year, from: dateOne)
        let monthOne: Int = cal.component(.month, from: dateOne)
        let yearTwo: Int = cal.component(.year, from: dateTwo)
        let monthTwo: Int = cal.component(.month, from: dateTwo)
        var rt: Bool = false
        if yearOne == yearTwo && monthOne == monthTwo {
            rt = true
        } else {
            rt = false
        }
        return rt
    }
    
    //MARK: cell得到日期
    func getCellDateStrFromFormat(formatStr: String, cellDate: Date) -> String {
        self.formate.dateFormat = formatStr
        return self.formate.string(from: cellDate)
    }

}
