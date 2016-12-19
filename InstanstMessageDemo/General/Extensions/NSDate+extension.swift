//
//  YJYDate_Categroy.swift
//  yuejuanyi
//
//  Created by gjc on 16/3/10.
//  Copyright © 2016年 yjtc. All rights reserved.
//

import UIKit

extension Date {
    /**
     获取这个月有多少天
     */
    func getMonthHowManyDay() -> Int {
        //我们大致可以理解为：某个时间点所在的“小单元”，在“大单元”中的数量
        return (Calendar.current as NSCalendar).range(of: .day, in:.month, for: self).length
    }
    
    // 获取日期是星期几
    func getDateWeekDay() -> Int {
        let dateFmt         = DateFormatter()
        dateFmt.dateFormat  = "yyyy-MM-dd HH:mm:ss"
        let interval        = Int(self.timeIntervalSince1970)
        let days            = Int(interval/86400)
        let weekday         = ((days + 4)%7+7)%7
        return weekday
    }
    
    /**
     *  获取这个月第一天是星期几
     */
    func getMontFirstWeekDay() -> Int {
        //1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
        let calendar = Calendar.current
        //这里注意 swift要用[,]这样方式写
        var com = (calendar as NSCalendar).components([.year,.month,.day], from: self)
        //设置成第一天
        com.day = 1
        let date = calendar.date(from: com)
        //我们大致可以理解为：某个时间点所在的“小单元”，在“大单元”中的位置  ordinalityOfUnit
        let firstWeekDay = (calendar as NSCalendar).ordinality(of: .weekday, in: .weekOfMonth, for: date!)
        return firstWeekDay - 1
    }
    
    /**
     *  获取当前Day
     */
    func getDay() -> Int {
        let calendar = Calendar.current
        //这里注意 swift要用[,]这样方式写
        let com = (calendar as NSCalendar).components([.year,.month,.day], from: self)
        return com.day!
    }
    
    /**
     *  获取当前Month
     */
    func getMonth() -> Int {
        let calendar = Calendar.current
        //这里注意 swift要用[,]这样方式写
        let com = (calendar as NSCalendar).components([.year,.month,.day], from: self)
        return com.month!
    }
    
    /**
     *  获取当前Year
     */
    func getYear() -> Int {
        let calendar = Calendar.current
        //这里注意 swift要用[,]这样方式写
        let com = (calendar as NSCalendar).components([.year,.month,.day], from: self)
        return com.year!
    }

    /**
     获取指定时间下一个月的时间
     */
    func getNextDate() ->Date {
        let calendar = Calendar.current
        var com = (calendar as NSCalendar).components([.year,.month,.day], from: self)
        com.month! += 1
        com.day = 1
        if com.month == Date().getMonth() {
            com.day = Date().getDay()
        }
        return calendar.date(from: com)!
    }
    
    /**
     获取指定时间上一个月的时间
     */
    func getLastDate() ->Date {
        let calendar = Calendar.current
        var com = (calendar as NSCalendar).components([.year,.month,.day], from: self)
        com.month! -= 1
        com.day = 1
        if com.month == Date().getMonth() {
            com.day = Date().getDay()
        }
        return calendar.date(from: com)!
    }
    
    /**
     获取指定时间下一个月的长度
     */
    func getNextDateLenght() ->Int {
        let date = self.getNextDate()
        return date.getMonthHowManyDay()
    }
    
    /**
     获取指定时间上一个月的长度
     */
    func getLastDateLenght() ->Int {
        let date = self.getLastDate()
        return date.getMonthHowManyDay()
    }
    
    //当前时间label内容
    func getTimeYYYY_MM() ->String {
        let day        = getDay()
        let month      = getMonth()
        let year       = getYear()
        let dateString = String("\(year)年\(month)月\(day)日")
        return dateString!
    }
    
    /**
     是否是今天
     */
    func isToday()->Bool {
        let calendar = Calendar.current
        /// 获取self的时间
        let comSelf = (calendar as NSCalendar).components([.year,.month,.day], from: self)
        /// 获取当前的时间
        let comNow = (calendar as NSCalendar).components([.year,.month,.day], from: Date())
        return comSelf.year==comNow.year && comSelf.month==comNow.month && comSelf.day==comNow.day
    }
    
    /**
     是否是这个月
     */
    func isEqualMonth(_ date : Date)->Bool {
        let calendar = Calendar.current
        /// 获取self的时间
        let comSelf = (calendar as NSCalendar).components([.year,.month,.day], from: self)
        /// 获取当前的时间
        let comNow = (calendar as NSCalendar).components([.year,.month,.day], from: date)
        return comSelf.year==comNow.year && comSelf.month==comNow.month
    }
    
    /**
     是否是这个月
     */
    func isThisMonth()->Bool {
        let calendar = Calendar.current
        /// 获取self的时间
        let comSelf = (calendar as NSCalendar).components([.year,.month,.day], from: self)
        /// 获取当前的时间
        let comNow = (calendar as NSCalendar).components([.year,.month,.day], from: Date())
        return comSelf.year==comNow.year && comSelf.month==comNow.month
    }
    
    /**
     分别获取准确的年月日
     */
    func getDateY_M_D(_ day : Int)->(year:Int,month:Int,day:Int) {
        let calendar = Calendar.current
        var comSelf = (calendar as NSCalendar).components([.year,.month,.day], from: self)
        comSelf.day = day
        return (comSelf.year!,comSelf.month!,comSelf.day!)
    }
    
    /**
     获取指定date
     */
    func getDate(_ day : Int)-> Date {
        let calendar = Calendar.current
        var comSelf = (calendar as NSCalendar).components([.year,.month,.day], from: self)
        comSelf.day = day
        return calendar.date(from: comSelf)!
    }
    
    /**
     把当前时间转化为字符串
    */
    func currentDateIntoString()-> String {
        let dateFormatter        = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timeString           = dateFormatter.string(from: self)
        return timeString
    }
}

