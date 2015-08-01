//
//  MemeTextFieldDelegate.swift
//  MemeMe
//
//  Created by Julia Will on 01.08.15.
//  Copyright (c) 2015 Julia Will. All rights reserved.
//

import Foundation
import UIKit

class MemeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
