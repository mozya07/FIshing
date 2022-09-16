//
//  AppDelegate.swift
//  sample
//
//  Created by cmStudent on 2022/08/27.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var backgroundTaskID : UIBackgroundTaskIdentifier = 0

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.

        return true
    }

    //バックグラウンド遷移移行直前に呼ばれる
    func applicationWillResignActive(application: UIApplication) {

        self.backgroundTaskID = application.beginBackgroundTaskWithExpirationHandler(){
            [weak self] in
            application.endBackgroundTask((self?.backgroundTaskID)!)
            self?.backgroundTaskID = UIBackgroundTaskInvalid
        }

    }

    //アプリがアクティブになる度に呼ばれる
    func applicationDidBecomeActive(application: UIApplication) {

        application.endBackgroundTask(self.backgroundTaskID)
    }

}
