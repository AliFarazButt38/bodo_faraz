import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Theme/palette.dart';

// ignore: must_be_immutable
class ErrorDialog extends StatefulWidget {
  String message,title;
  ErrorDialog({Key? key, required this.message, required this.title}) : super(key: key);

  @override
  State<ErrorDialog> createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<ErrorDialog> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      title: Center(child: Text(widget.title, style: const TextStyle(color: Palette.baseElementGreen, ),)),
      content: Text(widget.message,style: const TextStyle(color: Palette.grey74,  ),textAlign: TextAlign.center,),
      actions: [
        TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Text("OK", style: TextStyle(color: Palette.baseElementGreen, fontFamily: 'poppins_regular' ),)
        ),
      ],
    );
  }
}