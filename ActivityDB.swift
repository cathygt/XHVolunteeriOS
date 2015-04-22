//
//  ActivityDB.swift
//  XHVolunteeriOS
//
//  Created by silverwei on 15-4-22.
//  Copyright (c) 2015年 NineSoft. All rights reserved.
//

import Foundation

class ActivityDB: NSObject {
    var IndexId:Int //序号
    var ActivityName:String
    var TeamName:String //组别名称
    var UserName:String //发布者用户名称
    var ActStarTime:String //活动开始时间
    var ActEndTime:String //活动结束时间
    var ActAddress:String //活动举行地点
    var ActContent:String //活动简介
    var ActState:String //活动状态
    var ActAttend:Int //参加人数
    var ActJoinCount:Int //以报人数
    var Tick:Int //时间戳
    var IsJoining:Bool //是否开放
    var Id:Int

    
    init(IndexId:Int, ActivityName:String, TeamName:String, UserName:String, ActStarTime:String, ActEndTime:String, ActAddress:String, ActContent:String, ActState:String, ActAttend:Int, ActJoinCount:Int, Tick:Int, IsJoining:Bool, Id:Int)
    {
        self.IndexId = IndexId
        self.ActivityName = ActivityName
        self.TeamName = TeamName
        self.UserName = UserName
        self.ActStarTime = ActStarTime
        self.ActEndTime = ActEndTime
        self.ActAddress = ActAddress
        self.ActContent = ActContent
        self.ActState = ActState
        self.ActAttend = ActAttend
        self.ActJoinCount = ActJoinCount
        self.Tick = Tick
        self.IsJoining = IsJoining
        self.Id = Id
    }
}