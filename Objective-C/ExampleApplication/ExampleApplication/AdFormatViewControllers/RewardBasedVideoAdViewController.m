//
//  RewardBasedVideoAdViewController.m
//  ExampleApplication
//
//  Created by Levent ORAL on 23.11.2018.
//  Copyright © 2018 App Samurai Inc. All rights reserved.
//

#import "RewardBasedVideoAdViewController.h"

@interface RewardBasedVideoAdViewController ()

@property(nonatomic, strong) ASRewardBasedVideoAd *asRewardBasedVideoAd;

@end

@implementation RewardBasedVideoAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Initialize ASRewardBasedVideoAd
    _asRewardBasedVideoAd = [[ASRewardBasedVideoAd alloc] initWithAdUnitID:@"appsamurai-sample-ios-rewardbasedvideo-ad-id"];
    // Initialize ASRewardBasedVideoAd with optional gadAdUnitID for those who want to use Google Ad Mob flow
//    _asRewardBasedVideoAd = [[ASRewardBasedVideoAd alloc] initWithAdUnitID:@"appsamurai-sample-ios-rewardbasedvideo-ad-id" gadAdUnitID:@"/6499/example/rewarded-video"];
    // delegate is used to receive ad events
    _asRewardBasedVideoAd.delegate = self;
    
    // Load ad with request
    [_asRewardBasedVideoAd loadAdWithAdRequest:[[ASAdRequest alloc] init]];
}
- (IBAction)onShowRewardBasedVideoAdClicked:(id)sender {
    // Show ad when isReady is true. so you can only show ad when it's ready
    if (_asRewardBasedVideoAd != nil && _asRewardBasedVideoAd.isReady) {
        // Present ad
        [_asRewardBasedVideoAd presentWithRootViewController:self];
    }
}

#pragma ASRewardBasedVideoAdDelegate functions
// Notify when ad is succesfully received
- (void)rewardBasedVideoAdDidReceive:(ASRewardBasedVideoAd * _Nonnull)asRewardBasedAd {
    NSLog(@"%s", "rewardBasedVideoAdDidReceive");
}

// Notify when ad is failed to receive, check ASAdRequestError types and console logs for details
- (void)rewardBasedVideoAdDidFailToReceiveAd:(ASRewardBasedVideoAd * _Nonnull)asRewardBasedAd error:(ASAdRequestError * _Nonnull)error {
    NSLog(@"%s", "rewardBasedVideoAdDidFailToReceiveAd");
}

// Notify when ad is opened
- (void)rewardBasedVideoAdDidOpen:(ASRewardBasedVideoAd * _Nonnull)asRewardBasedAd {
    NSLog(@"%s", "rewardBasedVideoAdDidOpen");
}

// Notify when ad is closed
- (void)rewardBasedVideoAdDidClose:(ASRewardBasedVideoAd * _Nonnull)asRewardBasedAd {
    NSLog(@"%s", "rewardBasedVideoAdDidClose");
}

// Notify when video ad playback is started
- (void)rewardBasedVideoAdStartPlaying:(ASRewardBasedVideoAd * _Nonnull)asRewardBasedAd {
    NSLog(@"%s", "rewardBasedVideoAdStartPlaying");
}

// Notify when video ad playback is completed
- (void)rewardBasedVideoAdCompletePlaying:(ASRewardBasedVideoAd * _Nonnull)asRewardBasedAd {
    NSLog(@"%s", "rewardBasedVideoAdCompletePlaying");
}

// Notify when ad reward is succesfully received
- (void)rewardBasedVideoAdDidReward:(ASRewardBasedVideoAd * _Nonnull)asRewardBasedAd {
    NSLog(@"%s", "rewardBasedVideoAdDidReward");
}

// Notify when ad is clicked and another app will be opened
- (void)rewardBasedVideoAdWillLeaveApplication:(ASRewardBasedVideoAd * _Nonnull)asRewardBasedAd {
    NSLog(@"%s", "rewardBasedVideoAdWillLeaveApplication");
}
@end
