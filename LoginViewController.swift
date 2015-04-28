//
//  LoginViewController.swift
//  XHVolunteeriOS
//
//  Created by silverwei on 15-4-17.
//  Copyright (c) 2015年 NineSoft. All rights reserved.
//

import UIKit

var Identity:UserIdentity?

class LoginViewController: UIViewController {

    @IBOutlet var UserName: UITextField!
    
    @IBOutlet var UserPassword: UITextField!

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

        if(pullDownResult.PtrRequest == ResultType.Success)
        {
            if(pullDownResult.ErrorMsg == "成员")
            {
                self.performSegueWithIdentifier("MemberView", sender: self)
                Identity = UserIdentity.MemberView
            }
            else if (pullDownResult.ErrorMsg == "负责人" || pullDownResult.ErrorMsg == "具体负责人")
            {
                self.performSegueWithIdentifier("TeacherView", sender: self)
                Identity = UserIdentity.TeacherView
            }
        }
        else
        {
            var alert = UIAlertView()
            alert.title = "错误"
            alert.message = pullDownResult.ErrorMsg
            alert.addButtonWithTitle("取消")
            alert.show()
        }

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
