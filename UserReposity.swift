//
//  UserReposity.swift
//  XHVolunteeriOS
//
//  Created by silverwei on 15-4-17.
//  Copyright (c) 2015年 NineSoft. All rights reserved.
//

import Foundation

func UserLogin(用户名 UserName:String, 密码 Password:String) -> PullDownResult //登录
{
    let urlStr = NSString(format: "http://172.16.100.41:8080/MUser/%@", "Login")
    var UserRole:String = ""
    var pullDownResult = PullDownResult(PtrRequest: ResultType.Error, ErrorMsg: "")
    

    if let url = NSURL(string: urlStr) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 5.0
        postRequest.HTTPMethod = "POST"
        //postRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let param = [
            "UserName":UserName,
            "Password":Password
        ]
        let jsonparam = NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted, error: nil)

        postRequest.HTTPBody = jsonparam
        if let response = NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil, error: nil) {
            //let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            
            let json = JSON(data: response)
            if let userResultType = json["Type"].int
            {
                pullDownResult.PtrRequest = ResultType(rawValue: userResultType)!
            }
            if let userRole = json["ErrorMsg"].string
            {
                pullDownResult.ErrorMsg = userRole
            }

        }
    }
    return pullDownResult
}

func buttonFunc2()
{
    let urlStr = NSString(format: "http://172.16.100.41:8080/MUser/%@", "GetUserInfo")
    
    if let url = NSURL(string: urlStr) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 5.0
        postRequest.HTTPMethod = "POST"
        //postRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if let response = NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil, error: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            println(responsestr! + "\n")
        }
    }
}
