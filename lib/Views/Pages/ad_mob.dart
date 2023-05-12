// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// class RewardedAdExample extends StatefulWidget {
//
//   const RewardedAdExample({Key? key}) : super(key: key);
//
//   @override
//   _RewardedAdExampleState createState() => _RewardedAdExampleState();
// }
//
// class _RewardedAdExampleState extends State<RewardedAdExample> {
//
//   late RewardedAd _rewardedAd;
//   bool _isAdLoaded = false;
//   final adUnitId = "ca-app-pub-3940256099942544/5224354917";
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize the Mobile Ads SDK
//     MobileAds.instance.initialize();
//
//     // Load a rewarded ad
//     _loadRewardedAd();
//   }
//
//   void _loadRewardedAd() {
//     RewardedAd.load(
//       adUnitId: adUnitId,
//       request: const AdRequest(),
//       rewardedAdLoadCallback: RewardedAdLoadCallback(
//         onAdLoaded: (RewardedAd ad) {
//           setState(() {
//             _isAdLoaded = true;
//             _rewardedAd = ad;
//           });
//
//           _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
//             onAdDismissedFullScreenContent: (RewardedAd ad) {
//               ad.dispose();
//               _loadRewardedAd();
//             },
//             onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
//               ad.dispose();
//             },
//           );
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           debugPrint('Rewarded ad failed to load: $error');
//         },
//       ),
//     );
//   }
//
//   void _showRewardedAd() {
//     if (_isAdLoaded) {
//       _rewardedAd.show(onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
//         // Reward the user for watching an ad.
//       });
//
//
//     } else {
//       debugPrint('Ad is not loaded yet');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Rewarded Ad Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _showRewardedAd,
//           child: const Text('Show Rewarded Ad'),
//         ),
//       ),
//     );
//   }
// }
