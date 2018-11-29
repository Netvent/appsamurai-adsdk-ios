//
//  AppDelegate.swift
//  ExampleApplication
//
//  Created by Levent ORAL on 22.11.2018.
//  Copyright © 2018 App Samurai Inc. All rights reserved.
//

import UIKit
import AppSamuraiAdSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //: This is the initialization step for AppSamuraiAdSDK. Use test applicationId for testing, change with your applicationId.
        ASMobileAds.initialize(applicationId: "appsamurai-sample-ios-app-id")
        return true
    }
}

