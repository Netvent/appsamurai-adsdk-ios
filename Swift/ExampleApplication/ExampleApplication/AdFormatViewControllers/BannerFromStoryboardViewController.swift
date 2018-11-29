//
//  BannerFromStoryboardViewController.swift
//  ExampleApplication
//
//  Created by Levent ORAL on 23.11.2018.
//  Copyright © 2018 App Samurai Inc. All rights reserved.
//

import UIKit
import AppSamuraiAdSDK

class BannerFromStoryboardViewController: UIViewController, ASBannerViewDelegate {

    @IBOutlet weak var asBannerView: ASBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // adUnitID must be set to load correct ad. Use test id for debugging purposes
        asBannerView.adUnitID = "appsamurai-sample-ios-banner-ad-id"
        // rootViewController must be set to display overlay when ad is clicked
        asBannerView.rootViewController = self
        // delegate is used to receive ad events
        asBannerView.delegate = self
        
        // Load ad with request
        asBannerView.loadAd(adRequest: ASAdRequest())
    }
    
    //MARK: - ASBannerViewDelegate functions
    // Notify when ad is succesfully received
    func adViewDidReceiveAd(_ asBannerView: ASBannerView) {
        print("adViewDidReceiveAd")
    }
    
    // Notify when ad is failed to receive, check ASAdRequestError types and console logs for details
    func adViewDidFailToReceiveAd(_ asBannerView: ASBannerView, error: ASAdRequestError) {
        print("adViewDidFailToReceiveAd \(error.localizedDescription)")
    }
    
    // Notify when ad is clicked and another app will be opened
    func adViewWillLeaveApplication(_ asBannerView: ASBannerView) {
        print("adViewWillLeaveApplication")
    }
}
