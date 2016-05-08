//
//  ViewController.swift
//  PoseView1
//
//  Created by LI ZHANG on 4/4/2016.
//  Copyright © 2016年 bryan. All rights reserved.
//

import UIKit

let reuseIdentifier = "PhotoCell"

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var poseSource = PoseSource()
    //Actions & Outlets
  
    
    @IBOutlet weak var collectionView: UICollectionView!
   
    
    
    func swipedView(gesture: UIGestureRecognizer){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let swipeRec = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipedView(_:)))
        swipeRec.direction = .Right
        view.addGestureRecognizer(swipeRec)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//UICollectionDataSource mathods
     func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(poseSource)

        return poseSource.imgArray.count;
    }
  
    
    
     // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
      let cell: PhotoThumnail = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PhotoThumnail

      //Modify the cell
      cell.setThumbnailImage(poseSource.imgArray[indexPath.item]!)

        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showFull"){
            if let controller:ViewPhoto = segue.destinationViewController as? ViewPhoto{
                if let cell = sender as? UICollectionViewCell{
                    if let indexPath: NSIndexPath = self.collectionView.indexPathForCell(cell){
                        controller.index = indexPath.item
                        controller.poseSource = poseSource
                        controller.vc = self
                    }
                }
            }
        }
    }

}

