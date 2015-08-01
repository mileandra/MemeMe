//
//  MemeTextField.swift
//  MemeMe
//
//  Created by Julia Will on 01.08.15.
//  Copyright (c) 2015 Julia Will. All rights reserved.
//

import Foundation
import UIKit

class MemeTextField: UITextField {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let textAttributes = [
            NSStrokeWidthAttributeName: -5.0,
            NSStrokeColorAttributeName: UIColor.blackColor(),
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSFontAttributeName: UIFont(name: "Karbon", size: 40)!
        ]
        self.defaultTextAttributes = textAttributes
        self.font = UIFont(name: "Karbon", size: 40)!
        self.textAlignment = NSTextAlignment.Center
    }
    
}
