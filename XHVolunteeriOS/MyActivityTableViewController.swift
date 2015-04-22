//
//  MyActivityTableViewController.swift
//  XHVolunteeriOS
//
//  Created by silverwei on 15-4-14.
//  Copyright (c) 2015年 NineSoft. All rights reserved.
//

import UIKit

class MyActivityTableViewController: UITableViewController,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource {
    
    var loadMoreText = UILabel()
    
    let tableFooterView = UIView()//列表的底部，用于显示“上拉查看更多”的提示，当上拉后显示类容为“松开加载更多”。
    
    var page = 1//下拉加载后的页数
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //下拉刷新
        var refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("sortArray"), forControlEvents: UIControlEvents.ValueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新活动")
        self.refreshControl = refreshControl
        
        //上拉加载
        self.createTableFooter()

        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    ////////////////////////////////////////////////////
    //上拉加载
    
    func createTableFooter(){//初始化tv的footerView
        
        self.tableView.tableFooterView = nil
        
        tableFooterView.frame = CGRectMake(0, 0, self.tableView.bounds.size.width, 60)
        
        loadMoreText.frame =  CGRectMake(0, 0, self.tableView.bounds.size.width, 60)
        
        loadMoreText.text = "上拉查看更多"
        
        loadMoreText.textAlignment = NSTextAlignment.Center
        
        tableFooterView.addSubview(loadMoreText)
        
        self.tableView.tableFooterView = tableFooterView
    }
    
     override func scrollViewDidScroll(scrollView: UIScrollView){//开始上拉到特定位置后改变列表底部的提示
        
        if scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.frame.size.height + 30){
            
            loadMoreText.text = "松开载入更多"
            
        }else{
            
            loadMoreText.text = "上拉查看更多"
            
        }
        
    }
    
    override func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool){
        
        loadMoreText.text = "上拉查看更多"
        
        /*上拉到一定程度松开后开始加载更多*/
        
        if scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.frame.size.height + 30){
            
            page++
            
            self.initArr()
            println("更新数据库")
            self.tableView.reloadData()
            
        }
        
    }
    
    
    func initArr(){//上拉后加载数组arr
        
        for(var i=0;i<10;i++){
            
            println("当前是第\(page)页,第\(i+1)条")
            
        }
        
    }
    
    ////////////////////////////////////////////////////
    
    //下拉刷新
    func sortArray()
    {
        if self.refreshControl?.refreshing == true {
            
            self.refreshControl?.attributedTitle = NSAttributedString(string: "正在刷新活动...")
        }
        

        GetActivitiesData()
        
        tableView.reloadData()
        
        println("下拉刷新")
        
        refreshControl?.endRefreshing()
        if self.refreshControl?.refreshing == false
        {
            self.refreshControl?.attributedTitle = NSAttributedString(string: "下拉刷新活动")
        }
    }
    
    
    //显示不同的列表
    @IBAction func segmentDidchange(sender: UISegmentedControl) {
        println(sender.titleForSegmentAtIndex(sender.selectedSegmentIndex))

    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyActivityCell", forIndexPath: indexPath) as UITableViewCell
        
        return cell
    }

    @IBAction func CancelViewController(segue:UIStoryboardSegue)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
