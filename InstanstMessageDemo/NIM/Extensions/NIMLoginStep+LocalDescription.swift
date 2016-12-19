//
//  NIMLoginStep+LocalDescription.swift
//  InstanstMessageDemo
//
//  Created by huangzugang on 2016/12/17.
//  Copyright © 2016年 hzg. All rights reserved.
//

// 登录步骤本地描述
extension NIMLoginStep {
    var localDescription : String {
        switch self {
        case .linking:
            return "连接服务器"
        case .linkOK:
            return "连接服务器成功"
        case .linkFailed:
            return "连接服务器失败"
        case .logining:
            return "登录"
        case .loginOK:
            return "登录成功" // 已成功登录，获取到基本信息，并开始同步数据
        case .loginFailed:
            return "登录失败"
        case .syncing:
            return "开始同步" // 同步群信息，离线消息，漫游消息，系统通知等数据
        case .syncOK:
            return "同步完成" // 同步完成所有 IM 信息
        case .loseConnection:
            return "连接断开"
        case .netChanged:
            return "网络切换" // @discussion 这个并不是登录步骤的一种,但是UI有可能需要通过这个状态进行UI展现
        }
    }
}
