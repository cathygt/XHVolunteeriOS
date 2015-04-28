//
//  QRcodeShowViewController.swift
//  XHVolunteeriOS
//
//  Created by silverwei on 15-4-28.
//  Copyright (c) 2015年 NineSoft. All rights reserved.
//

import UIKit

class QRcodeShowViewController: UIViewController {

    var IndexId:Int?
    
    @IBOutlet var QRcodeView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println(IndexId)
        println("**")
        QRcodeView = UIImageView()
        QRcodeView.image = UIImage(named: "2015")
        self.view.addSubview(QRcodeView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
