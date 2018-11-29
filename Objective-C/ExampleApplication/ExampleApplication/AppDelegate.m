//
//  AppDelegate.m
//  ExampleApplication
//
//  Created by Levent ORAL on 22.11.2018.
//  Copyright © 2018 App Samurai Inc. All rights reserved.
//

#import "AppDelegate.h"
#import <AppSamuraiAdSDK/AppSamuraiAdSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // This is the initialization step for AppSamuraiAdSDK. Use test applicationId for testing, change with your applicationId.
    [ASMobileAds initialize:@"appsamurai-sample-ios-app-id"];
    return YES;
}

@end
