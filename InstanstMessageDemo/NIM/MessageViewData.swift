//
//  MessageViewData.swift
//  InstanstMessageDemo
//
//  Created by huangzugang on 2016/12/17.
//  Copyright © 2016年 hzg. All rights reserved.
//

class MessageViewData {
    
    // 列表单元行高
    let rowHeight:CGFloat = 64
    
    // 列表复用单元标志符
    let kMessageViewCell  = "kMessageViewCell"
    
    // 消息列表数据
    var tableDataArray    = [NIMRecentSession]()
    
    // MARK: - init methods
    // 构造
    init() {
        allRecentSessions()
    }
    
    // 析构
    deinit {
        tableDataArray.removeAll()
    }
    
    // MARK: - private methods
    private func allRecentSessions() {
        let recentSessions = NIM.conversationManager.allRecentSessions()
        if nil != recentSessions {
            tableDataArray.append(contentsOf: recentSessions!)
        }
    }
    
}
