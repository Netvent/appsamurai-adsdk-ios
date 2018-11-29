//
//  InterstitialViewController.m
//  ExampleApplication
//
//  Created by Levent ORAL on 23.11.2018.
//  Copyright © 2018 App Samurai Inc. All rights reserved.
//

#import "InterstitialViewController.h"
@import AppSamuraiAdSDK;

@interface InterstitialViewController ()

@property(nonatomic, strong) ASInterstitial *asInterstitial;

@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Initialize ASInterstitial
    _asInterstitial = [[ASInterstitial alloc] initWithAdUnitID:@"appsamurai-sample-ios-interstitial-ad-id"];
    // delegate is used to receive ad events
    _asInterstitial.delegate = self;
    
    // Load ad with request
    [_asInterstitial loadAdWithAdRequest:[[ASAdRequest alloc] init]];
}

- (IBAction)onShowInterstitialAdClicked:(id)sender {
    // Show ad when isReady is true and hasBeenUsed is false. so you can only show ad when it's ready and has not used before
    if (_asInterstitial != nil && _asInterstitial.isReady && !_asInterstitial.hasBeenUsed) {
        // Present ad
        [_asInterstitial presentWithRootViewController:self];
    }
}

#pragma ASRewardBasedVideoAdDelegate functions
// Notify when ad is succesfully received
- (void)interstitialDidReceiveAd:(ASInterstitial *_Nonnull)asInterstitial {
    NSLog(@"%s", "interstitialDidReceiveAd");
}

// Notify when ad is failed to receive, check ASAdRequestError types and console logs for details
- (void)interstitialDidFailToReceiveAd:(ASInterstitial *_Nonnull)asInterstitial error:(ASAdRequestError *_Nonnull)error {
    NSLog(@"%s", "interstitialDidFailToReceiveAd");
}

// Notify when ad will be presented screen on fullscreen
- (void)interstitialWillPresentScreen:(ASInterstitial *_Nonnull)asInterstitial {
    NSLog(@"%s", "interstitialWillPresentScreen");
}

// Notify when ad will dismiss from screen
- (void)interstitialWillDismissScreen:(ASInterstitial *_Nonnull)asInterstitial {
    NSLog(@"%s", "interstitialWillDismissScreen");
}

// Notify when ad dismissed from screen
- (void)interstitialDidDismissScreen:(ASInterstitial *_Nonnull)asInterstitial {
    NSLog(@"%s", "interstitialDidDismissScreen");
}

// Notify when ad is clicked and another app will be opened
- (void)interstitialWillLeaveApplication:(ASInterstitial *_Nonnull)asInterstitial {
    NSLog(@"%s", "interstitialWillLeaveApplication");
}

@end
