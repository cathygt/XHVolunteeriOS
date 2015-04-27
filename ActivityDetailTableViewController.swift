//
//  ActivityDetailTableViewController.swift
//  XHVolunteeriOS
//
//  Created by silverwei on 15-4-14.
//  Copyright (c) 2015年 NineSoft. All rights reserved.
//

import UIKit

class ActivityDetailTableViewController: UITableViewController {

    var ActivityDetail:ActivityDB!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        println(ActivityDetail.ActivityName)
        
        ActivityDetailShow()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //读取活动详细信息
    func ActivityDetailShow()
    {
        let cell = tableView.self as ActivityDetailCell
        cell.ActivityNameLabel.text = ActivityDetail.ActivityName
        cell.ActivityLocationLabel.text = ActivityDetail.ActivityLocation
        cell.JoinCountLabel.text = ActivityDetail.ActivityAttend.description + "/" + ActivityDetail.JoinCount.description
        cell.ActivityStartTimeLabel.text = DateTimeChange(ActivityDetail.ActivityStartTime)
        cell.ActivityEndTimeLabel.text = DateTimeChange(ActivityDetail.ActivityEndTime)
        cell.ActivitySummaryLabel.text = ActivityDetail.ActivitySummary
        cell.TeamNameLabel.text = ActivityDetail.TeamName
    }
    
    //日期格式转化
    func DateTimeChange(DateTime: String) -> String
    {
        return (DateTime as NSString).substringToIndex(10) + " " + ((DateTime as NSString).substringFromIndex(11) as NSString).substringToIndex(5)
    }
    
    //右上角弹出菜单内容
    @IBAction func ActivityMenu(sender: UIButton) {
        var actionSheet = UIActionSheet()
        actionSheet.addButtonWithTitle("取消")
        actionSheet.addButtonWithTitle("生成二维码")
        actionSheet.addButtonWithTitle("结束活动")
        actionSheet.cancelButtonIndex = 0
        actionSheet.showInView(self.view)
    }

    // MARK: - Table view data source

    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }
    */

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
