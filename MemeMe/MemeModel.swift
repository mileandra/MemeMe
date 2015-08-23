//
//  MemeModel.swift
//  MemeMe
//
//  Created by Julia Will on 03.08.15.
//  Copyright (c) 2015 Julia Will. All rights reserved.
//

import Foundation
import UIKit

class MemeModel: NSObject, NSCoding {
    
    var topText: String!
    var bottomText: String!
    var originalImage: UIImage!
    var memeImage: UIImage!
    
    
    required override init() {
        super.init()
    }
    
    required convenience init(topText: String, bottomText: String, originalImage: UIImage, memeImage: UIImage) {
        self.init()
        self.topText = topText
        self.bottomText = bottomText
        self.originalImage = originalImage
        self.memeImage = memeImage        
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        self.init()
        self.topText = aDecoder.decodeObjectForKey("topText") as! String
        self.bottomText = aDecoder.decodeObjectForKey("bottomText") as! String
        self.originalImage = aDecoder.decodeObjectForKey("originalImage") as! UIImage
        self.memeImage = aDecoder.decodeObjectForKey("memeImage") as! UIImage
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(topText, forKey: "topText")
        coder.encodeObject(bottomText, forKey: "bottomText")
        coder.encodeObject(originalImage, forKey: "originalImage")
        coder.encodeObject(memeImage, forKey: "memeImage")
    }
}
