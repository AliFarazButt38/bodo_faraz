import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:bodoo_flutter/Theme/style.dart';
import 'package:bodoo_flutter/Views/Pages/dashboard.dart';
import 'package:bodoo_flutter/Views/Pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../Theme/palette.dart';
import '../../Utils/screen_config.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController tokenController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: ScreenConfig.screenHeight,
          width: ScreenConfig.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:67.0,right: 67),
                child: SvgPicture.asset(
                    'assets/images/signin_pic.svg',
                    semanticsLabel: 'A red up arrow'
                ),
              ),
              //SizedBox(height: 18,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Verify Email',style: StyleSheet.heading,),
                    SizedBox(height: 10,),
                    Text('Verification token has been send to Email',style: TextStyle(color: Palette.grey,fontSize: 12),),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: tokenController,
                        style: TextStyle(
                          color: Palette.grey,
                          fontSize: 14,
                        ),
                        // onChanged: (value) {
                        //   setState(() {
                        //     emailController.text = value.toString();
                        //   });
                        // },
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          //add prefix icon
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/icons/email.svg',
                              semanticsLabel: 'A red up arrow',
                            ),
                          ),

                          // errorText: _errorMsg,
                          //  disabledBorder: OutlineInputBorder(
                          //    borderSide: const BorderSide(color: Palette.grey),
                          //    borderRadius: BorderRadius.circular(10),
                          //  ),
                          border:  OutlineInputBorder(
                            borderSide: const BorderSide(color: Palette.black),
                            borderRadius: BorderRadius.circular(10),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Palette.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Palette.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Palette.grey,

                          hintText: "Token",

                          //make hint text
                          hintStyle: TextStyle(
                            color: Palette.grey,
                            fontSize: 14,
                          ),

                          //create lable
                          labelText: 'Token',
                          //lable style
                          labelStyle: TextStyle(
                            color: Palette.grey,
                            fontSize: 14,
                          ),
                        ),

                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20,top: 30),
                child: ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      await Provider.of<AuthProvider>(context,listen: false).verifyEmail(tokenController.text,context);
                      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient:
                        const LinearGradient(colors: [Palette.baseElementBlue, Palette.baseElementGreen]),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      // width: 300,
                      height: 56,
                      alignment: Alignment.center,
                      child: const Text(
                        'Verify Email',
                        style:
                        const TextStyle(fontSize: 18, ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
