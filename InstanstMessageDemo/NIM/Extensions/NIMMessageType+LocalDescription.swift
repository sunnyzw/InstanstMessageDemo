//
//  NIMMessageType+LocalDescription.swift
//  InstanstMessageDemo
//
//  Created by huangzugang on 2016/12/18.
//  Copyright © 2016年 hzg. All rights reserved.
//

// 消息类型本地描述
extension NIMMessageType {
    var localDescription : String {
        switch self {
        case .text:
            return "文本类型消息"
        case .image:
            return "图片类型消息"
        case .audio:
            return "声音类型消息"
        case .video:
            return "视频类型消息"
        case .location:
            return "位置类型消息"
        case .notification:
            return "通知类型消息"
        case .file:
            return "文件类型消息"
        case .tip:
            return "提醒类型消息"
        case .custom:
            return "自定义类型消息"
        }
    }
}
