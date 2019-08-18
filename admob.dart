import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_admob/firebase_admob.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp2(),
    );
  }
}

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  
  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>[
      'travel',
      'backpackers',
      'hotel',
      'lifestyle',
    ],
    contentUrl: 'https://www.caspian.my',
    childDirected: true,
    testDevices: <String>[],
  );

  BannerAd myBanner = BannerAd(
    //adUnitId: BannerAd.testAdUnitId,
    adUnitId: "ca-app-pub-4895721634232616/7556063456",
    size: AdSize.smartBanner,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("BannerAd event:- $event");
    },
  );

// InterstitialAd myInterstitial = InterstitialAd(
//   adUnitId: InterstitialAd.testAdUnitId,
//   //adUnitId: "ca-app-pub-2650672046813337/3594268143",
//   targetingInfo: targetingInfo,
//   listener: (MobileAdEvent event) {
//     print("InterstitialAd event:- $event");
//   },
// );

  @override
  void initState() {
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-xxxxxxxxxxxxx~xxxxxxxxx");
    myBanner
      ..load()
      ..show();
    super.initState();
  }


  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final welcometext = Padding(
      padding: EdgeInsets.fromLTRB(10, 120, 10, 0),
      child: Text(
        'Welcome',
        style: TextStyle(fontSize: 30),
      ),
    );

    // final totext = Padding(
    //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
    //   child: Text(
    //     'to',
    //     style: TextStyle(fontSize: 20),
    //   ),
    // );

    final mybody = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.cyan[100],
        ]),
      ),
      child: Column(
        children: <Widget>[
          welcometext,
        ],
      ),
    );

    return Scaffold(
      body: mybody,
    );
  }

}
