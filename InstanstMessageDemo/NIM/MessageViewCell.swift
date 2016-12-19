//
//  MessageViewCell.swift
//  InstanstMessageDemo
//
//  Created by huangzugang on 2016/12/17.
//  Copyright © 2016年 hzg. All rights reserved.
//

//import Foundation

class MessageViewCell: UITableViewCell {
    
    // 好友／群／聊天室名称
    @IBOutlet weak var nameLabel: UILabel!
   
    // 最后条消息
    @IBOutlet weak var lastMessageLabel: UILabel!
    
    // 最后条消息发送的时间
    @IBOutlet weak var lastMessageTimeLabel: UILabel!
    
    // 头像/群头像/讨论组头像
    @IBOutlet weak var avatarImageView: UIImageView!

    // 群头像标志
    @IBOutlet weak var teamAvatarSignImageView: UIImageView!
    
    // MARK: - override methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - private methods
    // 更新头像
    private func updateAvatar(_ session:NIMSession) {
        
        // 会话类型
        let sessionType = session.sessionType
        
        // 会话Id
        let sessionId = session.sessionId
        
        // 打印会话类型
        Log.e("sessionType = \(sessionType.localDescription) sessionId = \(sessionId)")
        
        // 群头像标志显隐
        teamAvatarSignImageView.isHidden = true
        
        switch sessionType {
        case .P2P:
            // 好友信息
            let userInfo = NIM.userManager.userInfo(sessionId)?.userInfo
            // 好友昵称
            nameLabel.text = userInfo?.nickName
            // 好友头像
            let avatarUrl = userInfo?.avatarUrl ?? ""
            avatarImageView.setImageOfRound(urlStr: avatarUrl, placeholderStr: "yjy_img_head_portrait", radius: 24)
        case .team:
            // 群组信息
            let team = NIM.teamManager.team(byId: sessionId)
            if nil != team {
                // 群组名称
                nameLabel.text = team!.teamName
                // 群组头像
                let avatarUrl =  team!.avatarUrl ?? ""
                
                // 若是高级群，则显示群组标志
                if team!.type == .advanced {
                    teamAvatarSignImageView.isHidden = false
                }
                avatarImageView.setImageOfRound(urlStr: avatarUrl, placeholderStr: "yjy_img_head_portrait", radius: 24)
            }
        case .chatroom:
            Log.e("聊天室")
        }
    }
    
    // 更新最后条信息
    private func updateLastMessage(_ messageLabel:UILabel, _ lastMessage:NIMMessage?, _ isP2P:Bool = true) {
        // 最后条消息
        var lastMessageText = ""
        // 消息来源(群组和讨论组需要显示消息来源)
        var from            = ""
        
        if nil != lastMessage {
            let messageType = lastMessage!.messageType
            from            = lastMessage!.from ?? ""
            Log.e("messageType = \(messageType.localDescription)")
            // 若是文本类型的消息或是提示性的消息
            if messageType == .text || messageType == .tip {
                lastMessageText = lastMessage!.text ?? ""
            } else if messageType == .audio {
                lastMessageText = "[语音]"
            } else if messageType == .video {
                lastMessageText = "[视频]"
            } else if messageType == .file {
                lastMessageText = "[文件]"
            } else {
                lastMessageText = messageType.localDescription
            }
            
            messageLabel.text = isP2P ? lastMessageText : "\(from): \(lastMessageText)"
        }
    }
    
    // 更新最后时间
    private func updateLastTime(_ timeLabel:UILabel,_ timestamp:TimeInterval) {
        let df = DateFormatter()
        df.dateFormat="yyyy-MM-dd HH:mm"
        let date = Date(timeIntervalSince1970: timestamp)
        timeLabel.text = df.string(from: date)
    }
    
    // MARK: - public methods
    func update(_ recentSession:NIMRecentSession) {
        
        // 若会话为空
        if recentSession.session == nil {
            return
        }
        
        // 会话
        let session = recentSession.session!
        
        // 更新头像
        updateAvatar(session)
        
        // 更新最后条信息
        updateLastMessage(lastMessageLabel, recentSession.lastMessage, session.sessionType == .P2P)
        
        // 更新最后时间
        updateLastTime(lastMessageTimeLabel, recentSession.lastMessage?.timestamp ?? 0)
    }
}
