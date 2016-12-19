//
//  NIMTeamType+LocalDescription.swift
//  InstanstMessageDemo
//
//  Created by huangzugang on 2016/12/18.
//  Copyright © 2016年 hzg. All rights reserved.
//

// 群类型本地描述
extension NIMTeamType {
    var localDescription : String {
        switch self {
        case .normal:
            return "普通群(讨论组)"
        case .advanced:
            return "高级群"
        }
    }
}
