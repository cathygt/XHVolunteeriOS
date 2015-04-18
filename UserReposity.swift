//
//  UserReposity.swift
//  XHVolunteeriOS
//
//  Created by silverwei on 15-4-17.
//  Copyright (c) 2015年 NineSoft. All rights reserved.
//

import Foundation

private var responseData : NSMutableData!

func UserLogin(用户名 UserName:String, 密码 Password:String) -> String //登录
{
    let urlStr = NSString(format: "http://172.16.100.41:8080/MUser/%@", "Login")
    var UserRole:String = ""

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
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            
            let json = JSON(data: response)
            if let userRole = json["ErrorMsg"].string
            {
                println("***" + userRole + "\n")
                UserRole = userRole
                
            }
            
            println(responsestr! + "\n")
        }
    }
    return "身份：" + UserRole
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

/*

//连接到服务端后触发
func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
    responseData = NSMutableData()
}

//接收数据中
func connection(connection: NSURLConnection, didReceiveData data: NSData) {
    responseData.appendData(data)
}

//数据接收完毕
func connectionDidFinishLoading(connection: NSURLConnection) {
    let responsejson = NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments, error: nil)
    let str = NSString(data: responseData, encoding: NSUTF8StringEncoding)
    println(str)
}
*/