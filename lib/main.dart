import 'dart:io';

import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:bodoo_flutter/Providers/survey_provider.dart';
import 'package:bodoo_flutter/Providers/video_provider.dart';
import 'package:bodoo_flutter/Views/Pages/SubscriptionScreen.dart';
import 'package:bodoo_flutter/Views/Pages/forgot_password.dart';
import 'package:bodoo_flutter/Views/Pages/home.dart';
import 'package:bodoo_flutter/Views/Pages/splash_screen.dart';
import 'package:bodoo_flutter/Views/Pages/task_screen.dart';
import 'package:bodoo_flutter/Views/Pages/video_player_examole.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Utils/navigator.dart';
import 'Views/Pages/Joined_Community.dart';
import 'Views/Pages/SubscriptionPlan.dart';
import 'Views/Pages/community_screen.dart';
import 'Views/Pages/profile_screen.dart';
import 'Views/Pages/wallet_screen.dart';

void main() {
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => SurveyProvider()),
      ChangeNotifierProvider(create: (_) => VideoProvider()),
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
      home: SubscriptionPlan(),
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

