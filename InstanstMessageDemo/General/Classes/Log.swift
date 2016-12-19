//
//  Log.swift
//  yuejuanyi
//
//  Created by huangzugang on 16/10/13.
//  Copyright © 2016年 yjtc. All rights reserved.
//

// 日记封装
class Log {
    class func e(_ msg:Any, fileName:String = #file, lineNum:Int = #line) {
        if LOG_ENABLED {
            print("[\((fileName as NSString).lastPathComponent)(\(lineNum))]\(msg)")
        }
    }
}
