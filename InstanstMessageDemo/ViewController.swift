//
//  ViewController.swift
//  InstanstMessageDemo
//
//  Created by huangzugang on 2016/12/17.
//  Copyright © 2016年 hzg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - IBAction methods
    // 点击登录按钮
    @IBAction func onLoginButtonClicked(_ sender: UIButton) {
        if !NIM.loginManager.isLogined() {
            NIM.loginManager.add(self)
            let autoLoginData = NIMAutoLoginData()
            autoLoginData.account = NIM_USERNAME
            autoLoginData.token   = NIM_PASSWD
            autoLoginData.forcedMode = true
            NIM.loginManager.autoLogin(autoLoginData)
        }
    }

    // 点击登出按钮
    @IBAction func onLogoutButtonClicked(_ sender: UIButton) {
        if NIM.loginManager.isLogined() {
            NIM.loginManager.logout { (error) in
                Log.e(error ?? "登出成功")
            }
            NIM.loginManager.remove(self)
        }
    }
}

// MARK: - NIMLoginManagerDelegate
extension ViewController : NIMLoginManagerDelegate {
    
    // 被踢(服务器/其他端)回调
    func onKick(_ code: NIMKickReason, clientType: NIMLoginClientType) {
        Log.e("被踢原因: \(code.localDescription), 客户端类型: \(clientType.localDescription)")
    }
    
    // 登录回调
    func onLogin(_ step: NIMLoginStep) {
        Log.e("登录步骤 \(step.localDescription)")
        
        // 同步完成、跳转至会话界面
        if step == .syncOK {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "kMessageVC")
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // 自动登录失败回调
    func onAutoLoginFailed(_ error: Error) {
        Log.e("自动登录失败原因: \(error)")
    }
    
    // 多端登录发生变化
    func onMultiLoginClientsChanged() {
        Log.e("多端登录发生变化")
    }
}

