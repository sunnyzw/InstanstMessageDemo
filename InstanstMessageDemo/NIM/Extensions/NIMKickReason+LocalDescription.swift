//
//  NIMKickReason+LocalDescription.swift
//  InstanstMessageDemo
//
//  Created by huangzugang on 2016/12/17.
//  Copyright © 2016年 hzg. All rights reserved.
//

// 被踢下线的原因本地描述
extension NIMKickReason {
    var localDescription : String {
        switch self {
        case .byClient:
            return "被另外一个客户端踢下线 (互斥客户端一端登录挤掉上一个登录中的客户端)"
        case .byServer:
            return "被服务器踢下线"
        case .byClientManually:
            return "被另外一个客户端手动选择踢下线"
        }
    }
}
