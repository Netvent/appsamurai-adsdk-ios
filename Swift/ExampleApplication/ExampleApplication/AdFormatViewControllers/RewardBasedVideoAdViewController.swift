//
//  RewardBasedVideoAdViewController.swift
//  ExampleApplication
//
//  Created by Levent ORAL on 23.11.2018.
//  Copyright © 2018 App Samurai Inc. All rights reserved.
//

import UIKit
import AppSamuraiAdSDK

class RewardBasedVideoAdViewController: UIViewController, ASRewardBasedVideoAdDelegate {
    
    private var asRewardBasedVideoAd: ASRewardBasedVideoAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Initialize ASInterstitial
        asRewardBasedVideoAd = ASRewardBasedVideoAd(adUnitID: "appsamurai-sample-ios-rewardbasedvideo-ad-id")
        // delegate is used to receive ad events
        asRewardBasedVideoAd?.delegate = self
        
        // Load ad with request
        asRewardBasedVideoAd?.loadAd(adRequest: ASAdRequest())
    }
    @IBAction func onShowRewardBasedVideoAdClicked(_ sender: Any) {
        // Show ad when isReady is true. so you can only show ad when it's ready
        if asRewardBasedVideoAd?.isReady ?? false {
            // Present ad
            asRewardBasedVideoAd?.present(rootViewController: self)
        }
    }
    
    //MARK: - ASRewardBasedVideoAdDelegate functions
    // Notify when ad is succesfully received
    func rewardBasedVideoAdDidReceive(_ asRewardBasedAd: ASRewardBasedVideoAd) {
        print("rewardBasedVideoAdDidReceive")
    }
    
    // Notify when ad is failed to receive, check ASAdRequestError types and console logs for details
    func rewardBasedVideoAdDidFailToReceiveAd(_ asRewardBasedAd: ASRewardBasedVideoAd, error: ASAdRequestError) {
        print("rewardBasedVideoAdDidFailToReceiveAd \(error.localizedDescription)")
    }
    
    // Notify when ad is opened
    func rewardBasedVideoAdDidOpen(_ asRewardBasedAd: ASRewardBasedVideoAd) {
        print("rewardBasedVideoAdDidOpen")
    }

    // Notify when ad is closed
    func rewardBasedVideoAdDidClose(_ asRewardBasedAd: ASRewardBasedVideoAd) {
        print("rewardBasedVideoAdDidClose")
    }
    
    // Notify when video ad playback is started
    func rewardBasedVideoAdStartPlaying(_ asRewardBasedAd: ASRewardBasedVideoAd) {
        print("rewardBasedVideoAdStartPlaying")
    }
    
    // Notify when video ad playback is completed
    func rewardBasedVideoAdCompletePlaying(_ asRewardBasedAd: ASRewardBasedVideoAd) {
        print("rewardBasedVideoAdCompletePlaying")
    }
    
    // Notify when ad reward is succesfully received
    func rewardBasedVideoAdDidReward(_ asRewardBasedAd: ASRewardBasedVideoAd) {
        print("rewardBasedVideoAdDidReward")
    }
    
    // Notify when ad is clicked and another app will be opened
    func rewardBasedVideoAdWillLeaveApplication(_ asRewardBasedAd: ASRewardBasedVideoAd) {
        print("rewardBasedVideoAdWillLeaveApplication")
    }
}
