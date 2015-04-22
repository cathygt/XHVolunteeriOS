//
//  ActivityReposity.swift
//  XHVolunteeriOS
//
//  Created by silverwei on 15-4-17.
//  Copyright (c) 2015年 NineSoft. All rights reserved.
//

import Foundation
let BaseUrl = "172.16.100.41:8080/MActivity"

func GetActivitiesData(/* postData:PullDownRequest*/) // -> PtrResponse<ActivityDB>
{
    let urlStr = NSString(format: "http://%@/%@", BaseUrl , "GetActivitiesByPage")
    var UserRole:String = ""
    var param1 = PullDownRequest(ptrRequest: PtrRequest(Skip: 0, Count: 10, LocalData: PtrUpdateParam(Id: nil, IndexId: nil, Tick: nil), Guid: "aaa"), request: RequestType.All)
    
    if let url = NSURL(string: urlStr) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 5.0
        postRequest.HTTPMethod = "POST"
        
        //postRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let param = [
            "Skip":"4"
        ]
        println(param)
        
        let jsonparam = NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted, error: nil)
        postRequest.HTTPBody = jsonparam
        
        if let response = NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil, error: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            
            println(responsestr)
            
        }
    }
    
}
