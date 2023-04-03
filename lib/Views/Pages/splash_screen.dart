import 'dart:async';
import 'package:bodoo_flutter/Views/Pages/dashboard.dart';
import 'package:bodoo_flutter/Views/Pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/auth_provider.dart';
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
check();
  }

  check()async{
    var response = await Provider.of<AuthProvider>(context,listen: false).checkLoggedIn();
    print('reponse $response');
    Timer(const Duration(seconds: 3),
            (){
      if(response == true){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Signin()), (route) => false);
      }else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Dashboard()), (route) => false);
      }
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
