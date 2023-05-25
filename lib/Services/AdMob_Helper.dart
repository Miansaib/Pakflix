import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


class AdmobHelper {

  static String get bannerUnit => 'ca-app-pub-5820147958751736/6984724836';

  InterstitialAd? _interstitialAd;

  int num_of_attempt_load = 0;

  static initialization(){
    if(MobileAds.instance == null)
    {
      MobileAds.instance.initialize();
    }
  }
  static BannerAd getBannerAd(){
    BannerAd bAd = BannerAd(size: AdSize.fullBanner, adUnitId: 'ca-app-pub-5820147958751736/6984724836' , listener: BannerAdListener(
        onAdClosed: (Ad ad){
          if (kDebugMode) {
            print("Ad Closed");
          }
        },
        onAdFailedToLoad: (Ad ad,LoadAdError error){
          ad.dispose();
        },
        onAdLoaded: (Ad ad){
          if (kDebugMode) {
            print('Ad Loaded');
          }
        },
        onAdOpened: (Ad ad){
          if (kDebugMode) {
            print('Ad opened');
          }
        }
    ), request: const AdRequest());

    return bAd;
  }

  // create interstitial ads
  void createInterad(){

    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: const AdRequest(),
      adLoadCallback:InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad){
            _interstitialAd = ad;
            num_of_attempt_load =0;
          },
          onAdFailedToLoad: (LoadAdError error){
            num_of_attempt_load +1;
            _interstitialAd = null;

            if(num_of_attempt_load<=2){
              createInterad();
            }
          }),
    );

  }


// show interstitial ads to user
  void showInterad(){
    if(_interstitialAd == null){
      return;
    }

    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(

        onAdShowedFullScreenContent: (InterstitialAd ad){
          if (kDebugMode) {
            print("ad onAdshowedFullscreen");
          }
        },
        onAdDismissedFullScreenContent: (InterstitialAd ad){
          if (kDebugMode) {
            print("ad Disposed");
          }
          ad.dispose();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError aderror){
          if (kDebugMode) {
            print('$ad OnAdFailed $aderror');
          }
          ad.dispose();
          createInterad();
        }
    );

    _interstitialAd!.show();

    _interstitialAd = null;
  }


}