//
//  AppDelegate.swift
//  CourseList_swift
//
//  Created by luban on 2019/6/5.
//  Copyright © 2019年 hyn. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.rootViewController = TabBarController()
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        return true
    }

}

