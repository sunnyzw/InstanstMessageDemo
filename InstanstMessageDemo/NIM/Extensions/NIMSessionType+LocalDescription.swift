//
//  NIMSessionType+LocalDescription.swift
//  InstanstMessageDemo
//
//  Created by huangzugang on 2016/12/18.
//  Copyright © 2016年 hzg. All rights reserved.
//

// 会话类型本地描述
extension NIMSessionType {
    var localDescription : String {
        switch self {
        case .P2P:
            return "点对点"
        case .team:
            return "群组"
        case .chatroom:
            return "聊天室"
        }
    }
}
