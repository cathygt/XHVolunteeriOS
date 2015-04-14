//
//  Activity.swift
//  XHVolunteeriOS
//
//  Created by silverwei on 15-4-14.
//  Copyright (c) 2015年 NineSoft. All rights reserved.
//

import UIkit

class Activity: NSObject {
    var ActID:Int //活动管理号
    var Group:Int //发布活动的组别编号
    var UserName:String //发布者用户ID
    var ActTitle:String //活动标题
    var ActAddress:String //活动举行地点
    var ActContent:String //活动简介
    var ActStarTime:String //活动开始时间
    var ActEndTime:String //活动结束时间
    
    init(ActID:Int, Group:Int, UserName:String, ActTitle:String, ActAddress:String, ActContent:String, ActStarTime:String, ActEndTime:String)
    {
        self.ActID = ActID
        self.Group = Group
        self.UserName = UserName
        self.ActTitle = ActTitle
        self.ActAddress = ActAddress
        self.ActContent = ActContent
        self.ActStarTime = ActStarTime
        self.ActEndTime = ActEndTime
        
    }
}