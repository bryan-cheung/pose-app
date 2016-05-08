//
//  PhotoThumnail.swift
//  PoseView1
//
//  Created by LI ZHANG on 4/4/2016.
//  Copyright © 2016年 bryan. All rights reserved.
//

import UIKit

class PhotoThumnail: UICollectionViewCell {
    
    @IBOutlet weak var imgV: UIImageView!

      
    
    
    func setThumbnailImage(thumnailImage: UIImage){
        self.imgV.image = thumnailImage
    }

}
