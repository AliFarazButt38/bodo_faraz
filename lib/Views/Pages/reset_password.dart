import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:bodoo_flutter/Theme/style.dart';
import 'package:bodoo_flutter/Views/Pages/dashboard.dart';
import 'package:bodoo_flutter/Views/Pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../Theme/palette.dart';
import '../../Utils/screen_config.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController tokenController = TextEditingController();

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)){
      return 'Enter Valid Email';
    }
    else if(value.isEmpty){
      return 'Enter Email';
    }else {
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
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
                padding:  EdgeInsets.only(left:67.0.w,right: 67.w),
                child: SvgPicture.asset(
                    'assets/images/signin_pic.svg',
                    semanticsLabel: 'A red up arrow',
                  height: 294.h,
                  width: 294.w,
                ),
              ),
              //SizedBox(height: 18,),
              Padding(
                padding:  EdgeInsets.only(left: 20.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Reset Password',style: StyleSheet.heading,),
                    SizedBox(height: 10.h,),
                    Text('Enter your new password',style: TextStyle(color: Palette.grey,fontSize: 12.sp),),
                  ],
                ),
              ),
              SizedBox(height: 30.h,),
              Padding(
                padding:  EdgeInsets.only(left: 20.0.w,right: 20.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: tokenController,
                        style: TextStyle(
                          color: Palette.grey,
                          fontSize: 14.sp,
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
                            fontSize: 14.sp,
                          ),

                          //create lable
                          labelText: 'Token',
                          //lable style
                          labelStyle: TextStyle(
                            color: Palette.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                        // validator: validateEmail,
                      ),
                      SizedBox(height: 15.h,),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        style: TextStyle(
                          color: Palette.grey,
                          fontSize: 14.sp,
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
                              'assets/icons/password.svg',
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

                          hintText: "Password",

                          //make hint text
                          hintStyle: TextStyle(
                            color: Palette.grey,
                            fontSize: 14.sp,
                          ),

                          //create lable
                          labelText: 'New Password',
                          //lable style
                          labelStyle: TextStyle(
                            color: Palette.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                       // validator: validateEmail,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 20.0.w,right: 20.w,top: 30.h),
                child: ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                     await Provider.of<AuthProvider>(context,listen: false).resetPassword(tokenController.text,passwordController.text,context);
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
                      width: 388.w,
                      height: 56.h,
                      alignment: Alignment.center,
                      child:  Text(
                        'Reset Password',
                        style:
                         TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600 ),
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
