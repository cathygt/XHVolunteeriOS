//
//  SettingTableViewController.swift
//  XHVolunteeriOS
//
//  Created by silverwei on 15-4-14.
//  Copyright (c) 2015年 NineSoft. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        UserDetailShow()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func UserDetailShow()
    {
        var UserDetail:InfoOut! = GetUserInfo()
        let cell = tableView.self as GetUserCell
        cell.UserNameUILabel.text = UserDetail.UserName
        cell.PhoneNumberUILabel.text = UserDetail.PhoneNumber
        cell.TeamNameUILabel.text = UserDetail.TeamName
        cell.QQNumberUILabel.text = UserDetail.QQNumber
        cell.PersonalInfoUILabel.text = UserDetail.PersonalInfo
        cell.ActivityLongUILabel.text = UserDetail.ActivityLong + "小时"
        cell.SexUILabel.text = UserDetail.Sex == true ? "男" : "女"
    }
}
