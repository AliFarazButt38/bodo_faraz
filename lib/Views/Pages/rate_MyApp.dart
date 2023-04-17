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
      body:Center(
        child: ElevatedButton(onPressed: ()
        async{
          await RatingDialog.show(context);

        }, child: Text("rate app")),
      ),
    );
  }
}
