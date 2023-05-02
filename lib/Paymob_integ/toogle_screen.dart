import 'package:bodoo_flutter/Paymob_integ/reference_screen.dart';
import 'package:bodoo_flutter/Paymob_integ/visa_webview.dart';
import 'package:bodoo_flutter/Theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToogleScreen extends StatefulWidget {
  const ToogleScreen({Key? key}) : super(key: key);

  @override
  State<ToogleScreen> createState() => _ToogleScreenState();
}

class _ToogleScreenState extends State<ToogleScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return  Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 926.h,
          width: 428.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReferenceScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Container(
                    height: 400.h,
                    width: 428.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Palette.baseElementGreen),
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                      const LinearGradient(colors: [Colors.blueAccent, Colors.greenAccent]),
                    ),
                   // child: Center(child: Text('Refer Code', style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w700),)),
                    child:Image.network('https://cdn-icons-png.flaticon.com/128/4090/4090458.png') ,

                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VisaWebview()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Container(
                    height: 400.h,
                    width: 428.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Palette.baseElementBlue),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child:Image.network('https://cdn-icons-png.flaticon.com/128/349/349221.png') ,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
