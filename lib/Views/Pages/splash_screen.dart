import 'dart:async';
import 'package:bodoo_flutter/Views/Pages/dashboard.dart';
import 'package:bodoo_flutter/Views/Pages/signin.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AuthProvider>(context,listen: false).setPlatform();
     check();
    requestPermission();
    getToken();
    check();
    initInfo();
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

  void requestPermission()async{
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print('user granted permission');
    }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      print('user granted provisional permission');
    }else{
      print('user declined permission');
    }
  }

  void getToken() async {
    print('fcm start');
    await FirebaseMessaging.instance.getToken().then((token){
      print('fcm token $token');
      setState(() {
        // mToken = token!;
        Provider.of<AuthProvider>(context,listen: false).setFcmToken(token!);
      });
    });
  }

  void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }

  }

  initInfo()async{
    var androidInitialize = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitialize = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(android: androidInitialize, iOS: iosInitialize);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails('12132', 'wemeet', importance: Importance.high,priority: Priority.high,playSound: true);
        NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails,iOS: const DarwinNotificationDetails());
        await flutterLocalNotificationsPlugin.show(0, message.notification?.title, message.notification?.body, notificationDetails,payload: message.data['title']);
      }
    });

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
