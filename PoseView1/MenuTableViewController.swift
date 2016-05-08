//
//  MenuTableViewController.swift
//  PoseView1
//
//  Created by LI ZHANG on 6/4/2016.
//  Copyright © 2016年 bryan. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var singleArray = [
        UIImage(named: "single-1.jpg"), UIImage(named: "single-2.jpg"), UIImage(named: "single-3.jpg"), UIImage(named: "single-4.jpg"),
        UIImage(named: "single-5.jpg"), UIImage(named: "single-6.jpg"), UIImage(named: "single-7.jpg"), UIImage(named: "single-8.jpg"),
        UIImage(named: "single-9.jpg"), UIImage(named: "single-10.jpg"), UIImage(named: "single-11.jpg"), UIImage(named: "single-12.jpg"),
        UIImage(named: "single-13.jpg"), UIImage(named: "single-14.jpg"), UIImage(named: "single-15.jpg")
    ]
    var groupArray = [
        UIImage(named: "group-1.jpg"), UIImage(named: "group-2.jpg"), UIImage(named: "group-3.jpg"), UIImage(named: "group-4.jpg"),
        UIImage(named: "group-5.jpg"), UIImage(named: "group-6.jpg"), UIImage(named: "group-7.jpg"), UIImage(named: "group-8.jpg"),
        UIImage(named: "group-9.jpg"), UIImage(named: "group-10.jpg"), UIImage(named: "group-11.jpg"), UIImage(named: "group-12.jpg"),
        UIImage(named: "group-13.jpg"), UIImage(named: "group-14.jpg"), UIImage(named: "group-15.jpg")
    ]
    var coupleArray = [
        UIImage(named: "couple-1.jpg"), UIImage(named: "couple-2.jpg"), UIImage(named: "couple-3.jpg"), UIImage(named: "couple-4.jpg"),
        UIImage(named: "couple-5.jpg"), UIImage(named: "couple-6.jpg"), UIImage(named: "couple-7.jpg"), UIImage(named: "couple-8.jpg"),
        UIImage(named: "couple-9.jpg"), UIImage(named: "couple-10.jpg"), UIImage(named: "couple-11.jpg"), UIImage(named: "couple-12.jpg"),
        UIImage(named: "couple-13.jpg"), UIImage(named: "couple-14.jpg"), UIImage(named: "couple-15.jpg")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if(segue.identifier == "singleLink"){
                if let controller:ViewController = segue.destinationViewController as? ViewController{
                    var poseSource = PoseSource()
                    poseSource.imgArray = singleArray
                   controller.poseSource = poseSource
               }
           }
            
            if(segue.identifier == "coupleLink"){
                 print("couple")
                if let controller:ViewController = segue.destinationViewController as? ViewController{
                    var poseSource = PoseSource()
                    poseSource.imgArray = coupleArray
                    controller.poseSource = poseSource
                }
            }
            
            if(segue.identifier == "groupLink"){
                if let controller:ViewController = segue.destinationViewController as? ViewController{
                    var poseSource = PoseSource()
                    poseSource.imgArray = groupArray
                    controller.poseSource = poseSource
                }
            }
    
    }

}
