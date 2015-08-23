//
//  DetailViewController.swift
//  MemeMe
//
//  Created by Julia Will on 22.08.15.
//  Copyright (c) 2015 Julia Will. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var memeObject: MemeModel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if (memeObject != nil) {
            imageView.image = memeObject.memeImage
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "editMeme") {
            let navController = segue.destinationViewController as! UINavigationController
            let controller = navController.viewControllers[0] as! EditController
            controller.memeObject = memeObject
        }
    }
    
    
    @IBAction func deleteMeme(sender: AnyObject) {
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        
        if let index = find(appDelegate.memes, memeObject) {
            appDelegate.memes.removeAtIndex(index)
            appDelegate.saveData()
        }
        navigationController?.popViewControllerAnimated(true)
        
    }
 
}