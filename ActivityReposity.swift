//
//  ActivityReposity.swift
//  XHVolunteeriOS
//
//  Created by silverwei on 15-4-17.
//  Copyright (c) 2015年 NineSoft. All rights reserved.
//

import Foundation
let BaseUrl = "172.16.100.41:8080/MActivity"

func GetActivitiesData(postData :PullDownRequest) -> PtrResponse
{
    let urlStr = NSString(format: "http://%@/%@", BaseUrl , "GetActivitiesByPage") //GetActivitiesByPage是web端接口
    var UserRole:String = ""
    var param = PullDownRequest(ptrRequest: PtrRequest(Skip: 0, Count: 10, LocalData: PtrUpdateParam(Id: nil, IndexId: nil, Tick: nil), Guid: ""), request: postData.request) //请求的数据模型
    var Response:PtrResponse? //返回值的定义
    
    if let url = NSURL(string: urlStr) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 5.0
        postRequest.HTTPMethod = "POST"
        
        postRequest.HTTPBody = "{ptrRequest:{\"Skip\":\(param.ptrRequest.Skip),\"Count\":\(param.ptrRequest.Count),\"LocalData\":[],\"Guid\":\"\"},request:\"\(param.request.hashValue)\"}".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) //param数据转换为json格式发出请求
        
        if let response = NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil, error: nil) { //JSON返回数据
            
            //////////////////////////////////////////
            // 解析返回的JSON数据
            
            var json = JSON(data: response)
            var updateDB = [PtrUpdaeData]()
            for i in 0..<json["UpdateData"].count
            {
                updateDB.append(PtrUpdaeData(Type: UpdateType.NoChange, Data: ActivityDB(IndexId: json["UpdateData"][i]["Data"]["IndexId"].int!,
                    ActivityName: json["UpdateData"][i]["Data"]["ActivityName"].string!,
                    TeamName: json["UpdateData"][i]["Data"]["TeamName"].string!,
                    UserName: json["UpdateData"][i]["Data"]["UserName"].string!,
                    ActivityStartTime: json["UpdateData"][i]["Data"]["ActivityStartTime"].string!,
                    ActivityEndTime: json["UpdateData"][i]["Data"]["ActivityEndTime"].string!,
                    ActivityLocation: json["UpdateData"][i]["Data"]["ActivityLocation"].string!,
                    ActivitySummary: json["UpdateData"][i]["Data"]["ActivitySummary"].string!,
                    ActivityState: json["UpdateData"][i]["Data"]["ActivityState"].string!,
                    ActivityAttend: json["UpdateData"][i]["Data"]["ActivityAttend"].int!,
                    JoinCount: json["UpdateData"][i]["Data"]["JoinCount"].int!,
                    Tick: json["UpdateData"][i]["Data"]["Tick"].int!,
                    IsJoining: json["UpdateData"][i]["Data"]["IsJoining"].bool!,
                    Id: json["UpdateData"][i]["Data"]["Id"].int!)))
                
            }
            Response = PtrResponse(updatedata: updateDB, TotalCount: json["TotalCount"].int!, Guid: json["Guid"].string!)
            
            ////////////////////////////////////////
        }
    }
    return Response!
}
