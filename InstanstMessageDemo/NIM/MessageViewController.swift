//
//  MessageViewController.swift
//  InstanstMessageDemo
//
//  Created by huangzugang on 2016/12/17.
//  Copyright © 2016年 hzg. All rights reserved.
//

import UIKit

// 消息界面
class MessageViewController: UIViewController {

    // 消息列表
    @IBOutlet weak var tableView: UITableView!
    
    // 数据
    var data:MessageViewData = MessageViewData()
    
    // MARK: - overide methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - IBAction methods
    @IBAction func onBackButtonClicked(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
    
    // MARK: - private methods
    private func initUI() {
        
        // 列表初始化
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.rowHeight  = data.rowHeight
        
        // 列表注册可复用单元
        tableView.register(UINib(nibName: "MessageViewCell", bundle: nil), forCellReuseIdentifier: data.kMessageViewCell)
    }
}

// MARK: - UITableViewDataSource&UITableViewDelegate
extension MessageViewController : UITableViewDataSource, UITableViewDelegate {
    
    // MARK: UITableViewDataSource
    // 列表单元个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.tableDataArray.count
    }
    
    // 列表单元
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: data.kMessageViewCell, for: indexPath) as! MessageViewCell
        cell.update(data.tableDataArray[indexPath.row])
        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
