import 'dart:io';

import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:bodoo_flutter/Providers/survey_provider.dart';
import 'package:bodoo_flutter/Providers/video_provider.dart';
import 'package:bodoo_flutter/Views/Pages/forgot_password.dart';
import 'package:bodoo_flutter/Views/Pages/splash_screen.dart';
import 'package:bodoo_flutter/Views/Pages/video_player_examole.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Utils/navigator.dart';

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

