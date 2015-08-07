//
//  MemeModel.swift
//  MemeMe
//
//  Created by Julia Will on 03.08.15.
//  Copyright (c) 2015 Julia Will. All rights reserved.
//

import Foundation
import UIKit

class MemeModel: NSObject {
    
    var topText: NSString
    var bottomText: NSString
    var originalImage: UIImage
    var memeImage: UIImage
    
    required init(topText: NSString, bottomText: NSString, originalImage: UIImage, memeImage: UIImage) {
   
        self.topText = topText
        self.bottomText = bottomText
        self.originalImage = originalImage
        self.memeImage = memeImage
        super.init()
    }
    
}