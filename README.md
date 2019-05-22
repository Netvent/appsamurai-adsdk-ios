# AppSamurai Ad SDK
[![alt text](https://appsamurai.com/wp-content/uploads/2018/10/as_dark_logotype-8.png "AppSamurai")](https://www.appsamurai.com)
## Getting Started
AppSamurai Ad SDK targets iOS 8 or higher
### Using CocoaPods (preferred)
AppSamuraiAdSDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:
```ruby
pod 'AppSamuraiAdSDK'
```
It is also required to set `Always Embed Swift Libraries` to `Yes` from `Build Settings` for projects written in Objective-C
### Manual Integration
Download latest SDK from [Releases](https://github.com/Netvent/appsamurai-adsdk-ios/releases) and unzip it. Import the following framework into your Xcode project:
* AppSamuraiAdSDK.framework
* OMSDK_Appsamurai.framework

Add `AppSamuraiAdSDK.framework` to `Embedded Binaries` in `General`.
It is also required to set `Always Embed Swift Libraries` to `Yes` from `Build Settings` for projects written in Objective-C
#### Strip Unwanted Architectures
You need to do following steps to remove unwanted architectures to archive the applicaiton for the App Store; 
* Go to `Build Phases` in application target
* Add `New Run Script Phase` and add [strip.frameworks.sh](https://raw.githubusercontent.com/Netvent/appsamurai-adsdk-ios/master/strip.frameworks.sh) content in the text box.
## ASMobileAds Import
Application needs to import related modules to use AppSamuraiAdSDK. Add following lines to `import`’s to achieve this;

```swift
import AppSamuraiAdSDK
```
```objc
@import AppSamuraiAdSDK;
```
You can check version of SDK with `getSDKVersion` method
```swift
ASMobileAds.getSDKVersion()
```
```objc
[ASMobileAds getSDKVersion];
```
## ASMobileAds Initialization
ASMobileAds is required to configuration of ad units. Application can not request any ad before ASMobileAds initialization is complete.
In application’s `didFinishLaunchingWithOptions` callback, call  `ASMobileAds.initialize` function with `applicationId` parameter. This parameter should be your application id from [AppSamurai Monetization Dashboard](https://appsamurai.com/app-monetization/), you can use test application id for development purposes. Check following code for sample;
```swift
ASMobileAds.initialize(applicationId: "appsamurai-sample-ios-app-id")
```
```objc
[ASMobileAds initialize:@"appsamurai-sample-ios-app-id"];
```
## Test Units
AppSamuraiAdSDK uses test ads when one of the following conditions satisfy;
* Application runs on simulator,
* If test `applicationId` is used for ASMobileAds initialization.  
* If test `adUnitId` is used for ad unit creation.
* If `testDevices`  of `ASAdRequest` is set. (There will be log to show how to use `testDevices` when you call `loadAd` before request was made.)
## Log Level
AppSamuraiAdSDK logging level can be changed with `setLogLevel` after  `ASMobileAds.initialize` call.
```swift
ASMobileAds.setLogLevel(logLevel: .debug)
```
```objc
[ASMobileAds setLogLevelWithLogLevel:ASLogLevelDebug];
```
## Banner Ads
For current version, AppSamurai Ad SDK  only support 320x50 banner size, which is represented by ASAdSize.asAdSizeBanner.
You need to create a ASBannerView to display banner ads. It can be done via two approaches;
* From Storyboard
ASBannerView can be added to storyboard and xib file by defining `Custom Class` as ASBannerView in `Identity Inspector`. In this approach, setting `width` and `height` constraints is a must. For example, set  `width` and `height` 320 and 50 respectively for Banner_320x50.
* Programmatically
```swift
let asBannerView = ASBannerView(adSize: .asAdSizeBanner)
self.view.addSubview(asBannerView)

self.view.addConstraint(NSLayoutConstraint(item: asBannerView,
                                           attribute: .centerX,
                                           relatedBy: .equal,
                                           toItem: self.view,
                                           attribute: .centerX,
                                           multiplier: 1,
                                           constant: 1))
self.view.addConstraint(NSLayoutConstraint(item: asBannerView,
                                           attribute: .centerY,
                                           relatedBy: .equal,
                                           toItem: self.view,
                                           attribute: .centerY,
                                           multiplier: 1,
                                           constant: 1))
```
```objc
self.asBannerView = [[ASBannerView alloc] initWithAdSize: ASAdSize.asAdSizeBanner];
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
```
ASBannerView is now ready as view and it needs to be configured to display ad correctly.  `adUnitID` must be set. You need to use test id for debugging purposes. In simulator, test ads are used automatically. `rootViewController` must be set to present overlay when ad is clicked.
```swift
asBannerView.adUnitID = "appsamurai-sample-ios-banner-ad-id"
asBannerView.rootViewController = self
```
```objc
self.asBannerView.adUnitID = @"appsamurai-sample-ios-banner-ad-id";
self.asBannerView.rootViewController = self;
```
You’re ready to load ad.
```swift
asBannerView.loadAd(adRequest: ASAdRequest())
```
```objc
[self.asBannerView loadAdWithAdRequest:[[ASAdRequest alloc] init]];
```
Application can listen ad events from ASBannerView by setting `delegate` property with an object that implements `ASBannerViewDelegate` protocol.
```swift
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
```
```objc
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
```
## Interstitial
You need to create new ASInterstitial object each time when you want to display interstitial ad.
```swift
asInterstitial = ASInterstitial(adUnitID: "appsamurai-sample-ios-interstitial-ad-id")
```
```objc
_asInterstitial = [[ASInterstitial alloc] initWithAdUnitID:@"appsamurai-sample-ios-interstitial-ad-id"];
```
You’re ready to load ad.
```swift
asInterstitial.loadAd(adRequest: ASAdRequest())
```
```objc
[_asInterstitial loadAdWithAdRequest:[[ASAdRequest alloc] init]];
```
After loading completed, you can present ad any time. ASInterstitial needs be ready and has not used before to be presented. You need to check before presenting, otherwise `interstitialDidFailToReceiveAd` is dispatched with related error.
```swift
if asInterstitial.isReady && !asInterstitial?.hasBeenUsed {
    asInterstitial.present(rootViewController: self)
}
```
```objc
if (_asInterstitial != nil && _asInterstitial.isReady && !_asInterstitial.hasBeenUsed) {
  [_asInterstitial presentWithRootViewController:self];
}
```
Application can listen ad events from ASInterstitial by setting `delegate` property with an object that implements `ASInterstitialDelegate` protocol.
```swift
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
```
```objc
/// Notify when ad is succesfully received/
- (*void*)interstitialDidReceiveAd:(ASInterstitial **_Nonnull*)asInterstitial {
    NSLog(@"%s", "interstitialDidReceiveAd");
}

/// Notify when ad is failed to receive, check ASAdRequestError types and console logs for details/
- (*void*)interstitialDidFailToReceiveAd:(ASInterstitial **_Nonnull*)asInterstitial error:(ASAdRequestError **_Nonnull*)error {
    NSLog(@"%s", "interstitialDidFailToReceiveAd");
}

/// Notify when ad will be presented screen on fullscreen/
- (*void*)interstitialWillPresentScreen:(ASInterstitial **_Nonnull*)asInterstitial {
    NSLog(@"%s", "interstitialWillPresentScreen");
}

/// Notify when ad will dismiss from screen/
- (*void*)interstitialWillDismissScreen:(ASInterstitial **_Nonnull*)asInterstitial {
    NSLog(@"%s", "interstitialWillDismissScreen");
}

/// Notify when ad dismissed from screen/
- (*void*)interstitialDidDismissScreen:(ASInterstitial **_Nonnull*)asInterstitial {
    NSLog(@"%s", "interstitialDidDismissScreen");
}

/// Notify when ad is clicked and another app will be opened/
- (*void*)interstitialWillLeaveApplication:(ASInterstitial **_Nonnull*)asInterstitial {
    NSLog(@"%s", "interstitialWillLeaveApplication");
}
```
## RewardBasedVideoAd
You need to create new ASRewardBasedVideoAd object each time when you want to display interstitial ad.
```swift
asRewardBasedVideoAd = ASRewardBasedVideoAd(adUnitID: "appsamurai-sample-ios-rewardbasedvideo-ad-id")
```
```objc
_asRewardBasedVideoAd = [[ASRewardBasedVideoAd alloc] initWithAdUnitID:@"appsamurai-sample-ios-rewardbasedvideo-ad-id"];
```
You’re ready to load ad.
```swift
asRewardBasedVideoAd.loadAd(adRequest: ASAdRequest())
```
```objc
[_asRewardBasedVideoAd loadAdWithAdRequest:[[ASAdRequest alloc] init]];
```
After loading completed, you can present ad any time. ASRewardBasedVideoAd needs be ready to be presented. You need to check before presenting, otherwise `rewardBasedVideoAdDidFailToReceiveAd` is dispatched with related error.
```swift
if asRewardBasedVideoAd.isReady {
    asRewardBasedVideoAd.present(rootViewController: self)
}
```
```objc
if (_asRewardBasedVideoAd.isReady) {
    [_asRewardBasedVideoAd presentWithRootViewController:self];
}
```
Application can listen ad events from ASRewardBasedVideoAd by setting `delegate` property with an object that implements `ASRewardBasedVideoAdDelegate` protocol.
```swift
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
```
```objc
/// Notify when ad is succesfully received/
- (*void*)rewardBasedVideoAdDidReceive:(ASRewardBasedVideoAd * *_Nonnull*)asRewardBasedAd {
    NSLog(@"%s", "rewardBasedVideoAdDidReceive");
}

/// Notify when ad is failed to receive, check ASAdRequestError types and console logs for details/
- (*void*)rewardBasedVideoAdDidFailToReceiveAd:(ASRewardBasedVideoAd * *_Nonnull*)asRewardBasedAd error:(ASAdRequestError * *_Nonnull*)error {
    NSLog(@"%s", "rewardBasedVideoAdDidFailToReceiveAd");
}

/// Notify when ad is opened/
- (*void*)rewardBasedVideoAdDidOpen:(ASRewardBasedVideoAd * *_Nonnull*)asRewardBasedAd {
    NSLog(@"%s", "rewardBasedVideoAdDidOpen");
}

/// Notify when ad is closed/
- (*void*)rewardBasedVideoAdDidClose:(ASRewardBasedVideoAd * *_Nonnull*)asRewardBasedAd {
    NSLog(@"%s", "rewardBasedVideoAdDidClose");
}

/// Notify when video ad playback is started/
- (*void*)rewardBasedVideoAdStartPlaying:(ASRewardBasedVideoAd * *_Nonnull*)asRewardBasedAd {
    NSLog(@"%s", "rewardBasedVideoAdStartPlaying");
}

/// Notify when video ad playback is completed/
- (*void*)rewardBasedVideoAdCompletePlaying:(ASRewardBasedVideoAd * *_Nonnull*)asRewardBasedAd {
    NSLog(@"%s", "rewardBasedVideoAdCompletePlaying");
}

/// Notify when ad reward is succesfully received/
- (*void*)rewardBasedVideoAdDidReward:(ASRewardBasedVideoAd * *_Nonnull*)asRewardBasedAd {
    NSLog(@"%s", "rewardBasedVideoAdDidReward");
}

/// Notify when ad is clicked and another app will be opened/
- (*void*)rewardBasedVideoAdWillLeaveApplication:(ASRewardBasedVideoAd * *_Nonnull*)asRewardBasedAd {
    NSLog(@"%s", "rewardBasedVideoAdWillLeaveApplication");
}
```
## Author
App Samurai Mobile Team, mobile@appsamurai.com
## License
Copyright 2018 App Samurai Inc.
[![alt text](https://appsamurai.com/wp-content/uploads/2014/12/web_home_cta_2.png "AppSamurai")](https://www.appsamurai.com)