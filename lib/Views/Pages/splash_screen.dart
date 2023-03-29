import 'dart:async';
import 'package:bodoo_flutter/Views/Pages/signin.dart';
import 'package:flutter/material.dart';

import '../../Theme/palette.dart';
import '../../Utils/screen_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3),
            (){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Signin()), (route) => false);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      body: Container(
        height: ScreenConfig.screenHeight,
        width: ScreenConfig.screenWidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Palette.baseElementBlue,
                Palette.baseElementGreen,
              ],
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset('assets/images/logo_bg.png',fit: BoxFit.fill,),
                Image.asset('assets/images/logo.png',),
              ],
            )
          ],
        ),
      ),
    );
  }
}
