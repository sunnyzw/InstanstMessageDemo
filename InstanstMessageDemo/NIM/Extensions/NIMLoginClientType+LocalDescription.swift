//
//  NIMLoginClientType+LocalDescription.swift
//  InstanstMessageDemo
//
//  Created by huangzugang on 2016/12/17.
//  Copyright © 2016年 hzg. All rights reserved.
//

// 客户端类型本地描述
extension NIMLoginClientType {
    var localDescription : String {
        switch self {
        case .typeUnknown:
            return "未知类型"
        case .typeAOS:
            return "Android"
        case .typeiOS:
            return "iOS"
        case .typePC:
            return "PC"
        case .typeWP:
            return "WP"
        case .typeWeb:
            return "WEB"
        case .typeRestful:
            return "REST API"
        }
    }
}
