//
//  ViewPhoto.swift
//  PoseView1
//
//  Created by LI ZHANG on 4/4/2016.
//  Copyright © 2016年 bryan. All rights reserved.
//

import UIKit


class ViewPhoto: UIViewController {
    
    var index: Int = 0
//    var imgArray = [UIImage(named: "placeholder")]
    var poseSource = PoseSource()
    var vc: ViewController?
    
    

    @IBAction func btnExport(sender: AnyObject) {
        print("export")
                self.navigationController?.popToRootViewControllerAnimated(true)

    }
    
    
    @IBAction func btnTrash(sender: AnyObject) {
        print("trash")
    }
    
    @IBOutlet var imgView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeForNext = UISwipeGestureRecognizer(target: self, action: #selector(ViewPhoto.swipeForTheNext(_:)))
        swipeForNext.direction = .Left
        view.addGestureRecognizer(swipeForNext)
        
        let swipeForLater = UISwipeGestureRecognizer(target: self, action: #selector(ViewPhoto.swipeForTheLater(_:)))
        swipeForLater.direction = .Up
        view.addGestureRecognizer(swipeForLater)
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func swipeForTheNext(gesture: UIGestureRecognizer){
        let tapAlert = UIAlertController(title: "Pose App", message: "This post is completed? ", preferredStyle: UIAlertControllerStyle.Alert)
        tapAlert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: {(alertAction)in
            print("OK")
            if (self.poseSource.imgArray.count > 1) {
                self.poseSource.imgArray.removeAtIndex(self.index)
                if (self.index >= self.poseSource.imgArray.count) {
                    self.index = 0
                }
                self.imgView.image = self.poseSource.imgArray[self.index]!
                self.vc?.collectionView.reloadData()

            } else {
                print("this is the last one")
                self.navigationController?.popToRootViewControllerAnimated(true)
                self.vc?.collectionView.reloadData()

            }
            
        }))
        tapAlert.addAction(UIAlertAction(title: "Ignore", style: .Destructive, handler: {(alertAction)in
            print("Ignore")
        }))
        self.presentViewController(tapAlert, animated: true, completion: nil)
    }
    
    func swipeForTheLater(gesture: UIGestureRecognizer){
        if (self.poseSource.imgArray.count > 1) {
            let item = self.poseSource.imgArray[self.index]
            self.poseSource.imgArray.removeAtIndex(self.index)
            self.poseSource.imgArray.append(item)
            if (self.index == (self.poseSource.imgArray.count - 1)) {
                self.index = 0
            }
            self.imgView.image = self.poseSource.imgArray[self.index]!
            self.vc?.collectionView.reloadData()

        } else {
            print("this is the last one")
            self.navigationController?.popToRootViewControllerAnimated(true)
            self.vc?.collectionView.reloadData()

        }
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        self.imgView.contentMode = UIViewContentMode.ScaleAspectFit
        self.navigationController?.hidesBarsOnTap = true
        self.imgView.image = poseSource.imgArray[index]!
    }
}
