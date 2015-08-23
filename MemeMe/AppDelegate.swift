//
//  AppDelegate.swift
//  MemeMe
//
//  Created by Julia Will on 31.07.15.
//  Copyright (c) 2015 Julia Will. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var memes = [MemeModel]()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let defaults = NSUserDefaults.standardUserDefaults()
        
        //Save according to http://stackoverflow.com/questions/29057238/how-to-unarchive-custom-array-with-nsuserdefaults
        if let memesTemp = defaults.dataForKey("memes") {
            if let memesUnpacked = NSKeyedUnarchiver.unarchiveObjectWithData(memesTemp) as? [MemeModel] {
                memes = memesUnpacked
            }
        }
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        saveData()
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        saveData()
    }
    
    func saveData() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let memesPacked = NSKeyedArchiver.archivedDataWithRootObject(memes)
        defaults.setObject(memesPacked, forKey: "memes");
        defaults.synchronize()
    }


}

