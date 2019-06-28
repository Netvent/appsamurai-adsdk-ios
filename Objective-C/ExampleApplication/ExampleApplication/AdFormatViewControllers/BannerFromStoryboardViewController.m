//
//  BannerFromStoryboardViewController.m
//  ExampleApplication
//
//  Created by Levent ORAL on 23.11.2018.
//  Copyright © 2018 App Samurai Inc. All rights reserved.
//

#import "BannerFromStoryboardViewController.h"

@interface BannerFromStoryboardViewController ()

@property (weak, nonatomic) IBOutlet ASBannerView *asBannerView;

@end

@implementation BannerFromStoryboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // adUnitID must be set to load correct ad. Use test id for debugging purposes
    self.asBannerView.adUnitID = @"appsamurai-sample-ios-banner-ad-id";
    // Optional gadAdUnitID for those who want to use Google Ad Mob flow
//    self.asBannerView.gadAdUnitID = @"/6499/example/banner";
    // rootViewController must be set to display overlay when ad is clicked
    self.asBannerView.rootViewController = self;
    // delegate is used to receive ad events
    self.asBannerView.delegate = self;
    
    // load ad with request
    [self.asBannerView loadAdWithAdRequest:[[ASAdRequest alloc] init]];
}

#pragma ASBannerViewDelegate functions
// Notify when ad is succesfully received
- (void)adViewDidReceiveAd:(ASBannerView * _Nonnull)asBannerView {
    NSLog(@"%s", "adViewDidReceiveAd");
}

// Notify when ad is failed to receive, check ASAdRequestError types and console logs for details
- (void)adViewDidFailToReceiveAd:(ASBannerView * _Nonnull)asBannerView error:(ASAdRequestError * _Nonnull)error {
    NSLog(@"%s", "adViewDidFailToReceiveAd");
}

// Notify when ad is clicked and another app will be opened
- (void)adViewWillLeaveApplication:(ASBannerView * _Nonnull)asBannerView {
    NSLog(@"%s", "adViewWillLeaveApplication");
}

@end
