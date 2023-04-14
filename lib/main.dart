import 'dart:io';

import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:bodoo_flutter/Providers/community_provider.dart';
import 'package:bodoo_flutter/Providers/home_provider.dart';
import 'package:bodoo_flutter/Providers/level_provider.dart';
import 'package:bodoo_flutter/Providers/survey_provider.dart';
import 'package:bodoo_flutter/Providers/video_provider.dart';
import 'package:bodoo_flutter/Providers/wallet_provider.dart';
import 'package:bodoo_flutter/Providers/write_review_provider.dart';
import 'package:bodoo_flutter/Views/Pages/SubscriptionScreen.dart';
import 'package:bodoo_flutter/Views/Pages/app_detail.dart';
import 'package:bodoo_flutter/Views/Pages/download_appScreen.dart';
import 'package:bodoo_flutter/Views/Pages/facebook_auth.dart';
import 'package:bodoo_flutter/Views/Pages/forgot_password.dart';
import 'package:bodoo_flutter/Views/Pages/rate_MyApp.dart';
import 'package:bodoo_flutter/Views/Pages/splash_screen.dart';
import 'package:bodoo_flutter/Views/Pages/userdetails_form.dart';
import 'package:bodoo_flutter/Views/Pages/video_player_examole.dart';
import 'package:bodoo_flutter/Views/Pages/webview_survey.dart';
import 'package:bodoo_flutter/Views/Pages/withdraw_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/Google_SignInProvider.dart';
import 'Providers/download_apps_provider.dart';
import 'Utils/navigator.dart';
import 'Views/Pages/SubscriptionPlan.dart';
import 'Views/Pages/home.dart';
import 'Views/Pages/task_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Views/Pages/write_Areview.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => SurveyProvider()),
      ChangeNotifierProvider(create: (_) => VideoProvider()),
      ChangeNotifierProvider(create: (_) => DownloadAppsProvider()),
      ChangeNotifierProvider(create: (_) => LevelProvider()),
      ChangeNotifierProvider(create: (_) => WriteReviewProvider()),
      ChangeNotifierProvider(create: (_) => WalletProvider()),
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => CommunityProvider()),
      ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),

    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Values.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  SplashScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

