//
//  AppDelegate.swift
//  TestApp
//
//  Created by Jeroen Berrevoets on 17/10/15.
//  Copyright © 2015 Jeroen Berrevoets. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: Types
    enum ShortcutIdentifier: String {
        case incrementTen
        case decrementTen
        
        init?(fullType: String) {
            guard let last = fullType.componentsSeparatedByString(".").last else { return nil }
            
            self.init(rawValue: last)
        }
    }
    
    // MARK: Properties
    var launchedShortcutItem: UIApplicationShortcutItem?
    var window: UIWindow?
    
    // MARK: Shortcut Handlers
    private func handleShortcut(shortcutItem: UIApplicationShortcutItem) -> Bool {
        let shortcutType = shortcutItem.type
        guard let shortcutIdentifier = ShortcutIdentifier(fullType: shortcutType) else {
            return false
        }
        guard let viewController = self.window?.rootViewController as? ViewController else {
            return false;
        }
        
        switch(shortcutIdentifier){
        case .decrementTen:
            viewController.decrementAmount(10)
            return true
        case .incrementTen:
            viewController.incrementAmount(10)
            return true
        }
    }
    

    // MARK: Life Cycle
    
    func application(application: UIApplication,
        performActionForShortcutItem shortcutItem: UIApplicationShortcutItem,
        completionHandler: (Bool) -> Void) {
            
            completionHandler(handleShortcut(shortcutItem))
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

