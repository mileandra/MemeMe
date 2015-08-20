//
//  SentMemesTableViewController.swift
//  MemeMe
//
//  Created by Julia Will on 15.08.15.
//  Copyright (c) 2015 Julia Will. All rights reserved.
//

import Foundation
import UIKit


class SentMemesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var memes: [MemeModel]!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        memes = appDelegate.memes
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeMeTableViewCell") as! UITableViewCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
}