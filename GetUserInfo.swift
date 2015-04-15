//
//  GetUserInfo.swift
//  XHVolunteeriOS
//
//  Created by silverwei on 15-4-15.
//  Copyright (c) 2015年 NineSoft. All rights reserved.
//

import Foundation

class InfoIn: NSObject {
    var UserId:Int
    
    init(UserId:Int)
    {
        self.UserId = UserId
    }
}

class InfoOut: NSObject {
    var UserId:Int
    var UserName:String
    var UserRole:String
    var PhoneNumber:String
    var TeamName:String
    var PersonalInfo:String
    var ActivityLong:String
    var Sex:Bool
    var Tick:Bool
    
    init(UserId:Int, UserName:String, UserRole:String, PhoneNumber:String, TeamName:String, PersonalInfo:String, ActivityLong:String, Sex:Bool, Tick:Bool)
    {
        self.UserId = UserId
        self.UserName = UserName
        self.UserRole = UserRole
        self.PhoneNumber = PhoneNumber
        self.TeamName = TeamName
        self.PersonalInfo = PersonalInfo
        self.ActivityLong = ActivityLong
        self.Sex = Sex
        self.Tick = Tick
    }
}