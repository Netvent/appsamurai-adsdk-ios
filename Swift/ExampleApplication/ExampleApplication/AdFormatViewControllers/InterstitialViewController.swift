//
//  InterstitialViewController.swift
//  ExampleApplication
//
//  Created by Levent ORAL on 23.11.2018.
//  Copyright © 2018 App Samurai Inc. All rights reserved.
//

import UIKit
import AppSamuraiAdSDK

class InterstitialViewController: UIViewController, ASInterstitialDelegate {
    
    private var asInterstitial: ASInterstitial?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Initialize ASInterstitial
        asInterstitial = ASInterstitial(adUnitID: "appsamurai-sample-ios-interstitial-ad-id")
        // Initialize ASInterstitial with optional gadAdUnitID for those who want to use Google Ad Mob flow
//        asInterstitial = ASInterstitial(adUnitID: "appsamurai-sample-ios-interstitial-ad-id", gadAdUnitID: "/6499/example/interstitial")
        // delegate is used to receive ad events
        asInterstitial?.delegate = self
        
        // Load ad with request
        asInterstitial?.loadAd(adRequest: ASAdRequest())
    }
    
    @IBAction func onShowInterstitialAdClicked(_ sender: Any) {
        // Show ad when isReady is true and hasBeenUsed is false. so you can only show ad when it's ready and has not used before
        if (asInterstitial?.isReady ?? false) && !(asInterstitial?.hasBeenUsed ?? true) {
            // Present ad
            asInterstitial?.present(rootViewController: self)
        }
    }
    
    //MARK: - ASInterstitialDelegate functions
    // Notify when ad is succesfully received
    func interstitialDidReceiveAd(_ asInterstitial: ASInterstitial) {
        print("interstitialDidReceiveAd")
    }
    
    // Notify when ad is failed to receive, check ASAdRequestError types and console logs for details
    func interstitialDidFailToReceiveAd(_ asInterstitial: ASInterstitial, error: ASAdRequestError) {
        print("interstitialDidFailToReceiveAd \(error.localizedDescription)")
    }
    
    // Notify when ad will be presented screen on fullscreen
    func interstitialWillPresentScreen(_ asInterstitial: ASInterstitial) {
        print("interstitialWillPresentScreen")
    }
    
    // Notify when ad will dismiss from screen
    func interstitialWillDismissScreen(_ asInterstitial: ASInterstitial) {
        print("interstitialWillDismissScreen")
    }
    
    // Notify when ad dismissed from screen
    func interstitialDidDismissScreen(_ asInterstitial: ASInterstitial) {
        print("interstitialDidDismissScreen")
    }
    
    // Notify when ad is clicked and another app will be opened
    func interstitialWillLeaveApplication(_ asInterstitial: ASInterstitial) {
        print("interstitialWillLeaveApplication")
    }
}
