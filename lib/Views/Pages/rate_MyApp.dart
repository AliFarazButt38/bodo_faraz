import 'package:flutter/material.dart';

import '../Widgets/rating_dialogue.dart';

class RateMyApp extends StatefulWidget {
  const RateMyApp({Key? key}) : super(key: key);

  @override
  State<RateMyApp> createState() => _RateMyAppState();
}

class _RateMyAppState extends State<RateMyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: ElevatedButton(onPressed: (){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const RatingDialog();
            },
          );
        }, child: Text("Rate My App")),
      )),
    );
  }
}
