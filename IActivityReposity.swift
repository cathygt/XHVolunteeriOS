//
//  IActivityReposity.swift
//  XHVolunteeriOS
//
//  Created by silverwei on 15-4-15.
//  Copyright (c) 2015年 NineSoft. All rights reserved.
//

import Foundation

protocol ActivityReposity
{
    
    func GetActivityInfos(活动ID activityid:Int, 时间戳 tick:Int) //获取活动详细最新信息---返回值暂未写
    func EndActivity(活动ID activityid:Int) -> PullDownResult //结束活动
    func GetActivitiesData(postData:String) //下拉刷新确认
    func AddApply(activityid:Int) -> PullDownResult //参加报名
    func ScanCode(activityid:Int) -> ScanCodeRequest //首次刷二维码
    func TwoScanCode(activityid:Int) -> ScanCodeRequest //第二次刷二维码
    
}