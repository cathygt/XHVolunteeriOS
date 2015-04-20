//
//  LoginViewController.swift
//  XHVolunteeriOS
//
//  Created by silverwei on 15-4-17.
//  Copyright (c) 2015年 NineSoft. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var UserName: UITextField!
    
    @IBOutlet var UserPassword: UITextField!
    
    @IBOutlet var UserNameText: UILabel!
    
    private var responseData : NSMutableData!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func UserLoginButton(sender: UIButton) {
        let pullDownResult:PullDownResult = UserLogin(用户名: UserName.text,密码: UserPassword.text)
        UserNameText.text = pullDownResult.ErrorMsg
        
        
    }

    @IBAction func Button2(sender: UIButton) {
        buttonFunc2()
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}
