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
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        memes = appDelegate.memes
        
        // Reload data in case a new meme was created
        tableView.reloadData()
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeMeTableViewCell") as! UITableViewCell
        cell.imageView?.image = memes[indexPath.row].memeImage
        cell.textLabel?.text = "\(memes[indexPath.row].topText)...\(memes[indexPath.row].bottomText)"
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println(memes)
        return memes.count
    }
    
   

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showDetailFromTable") {
            let controller = segue.destinationViewController as! DetailViewController
            controller.memeObject = memes[tableView.indexPathForSelectedRow()!.row]
        }
    }
}