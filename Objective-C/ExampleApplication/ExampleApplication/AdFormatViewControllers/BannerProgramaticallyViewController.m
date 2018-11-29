//
//  BannerProgramaticallyViewController.m
//  ExampleApplication
//
//  Created by Levent ORAL on 23.11.2018.
//  Copyright © 2018 App Samurai Inc. All rights reserved.
//

#import "BannerProgramaticallyViewController.h"

@interface BannerProgramaticallyViewController ()

@property(nonatomic, strong) ASBannerView *asBannerView;

@end

@implementation BannerProgramaticallyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Initialize ASBannerView for Banner_320x50
    self.asBannerView = [[ASBannerView alloc] initWithAdSize: ASAdSize.asAdSizeBanner];
    // adUnitID must be set to load correct ad. Use test id for debugging purposes
    self.asBannerView.adUnitID = @"appsamurai-sample-ios-banner-ad-id";
    // rootViewController must be set to display overlay when ad is clicked
    self.asBannerView.rootViewController = self;
    // delegate is used to receive ad events
    self.asBannerView.delegate = self;
    
    [self.view addSubview:self.asBannerView];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.asBannerView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:1]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.asBannerView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1
                                                           constant:1]];
    
    // Load ad with request
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
