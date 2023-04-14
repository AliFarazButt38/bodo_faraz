import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:bodoo_flutter/Theme/style.dart';
import 'package:bodoo_flutter/Views/Pages/dashboard.dart';
import 'package:bodoo_flutter/Views/Pages/forgot_password.dart';
import 'package:bodoo_flutter/Views/Pages/signup.dart';
import 'package:bodoo_flutter/Views/Pages/userdetails_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../Providers/Google_SignInProvider.dart';
import '../../Theme/palette.dart';
import '../../Utils/screen_config.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


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

    ScreenConfig().init(context);
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: ScreenConfig.screenHeight,
          width: ScreenConfig.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left:67.0.w,right: 67.w,top: 10.h),
                child: SvgPicture.asset(
                    'assets/images/signin_pic.svg',
                    semanticsLabel: 'A red up arrow',
                  height: 294.h,
                  width: 294.h,
                ),
              ),
              //SizedBox(height: 18,),
              Padding(
                padding:  EdgeInsets.only(left: 20.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sign in',style: StyleSheet.heading,),
                    SizedBox(height: 10.h,),
                    Text('Welcome back to Bodo App',style: TextStyle(color: Palette.grey,fontSize: 16.sp),),
                  ],
                ),
              ),
              //SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.only(left: 20.0.w,right: 20.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: emailController,
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
                            padding: EdgeInsets.all(10.0.w),
                            child: SvgPicture.asset(
                                'assets/icons/email.svg',
                                semanticsLabel: 'A red up arrow',
                              height: 21.h,
                              width: 28.w,
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

                          hintText: "Email",

                          //make hint text
                          hintStyle: TextStyle(
                            color: Palette.grey,
                            fontSize: 14.sp,
                          ),

                          //create lable
                          labelText: 'Email',
                          //lable style
                          labelStyle: TextStyle(
                            color: Palette.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                        validator: validateEmail,
                      ),
                      SizedBox(height: 10.h,),
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
                            padding:  EdgeInsets.all(10.0.w),
                            child: SvgPicture.asset(
                              'assets/icons/password.svg',
                              semanticsLabel: 'A red up arrow',
                              height: 21.h,
                              width: 28.w,
                            ),
                          ),

                          // errorText: _errorMsg,

                          border:  OutlineInputBorder(
                            borderSide: const BorderSide(color: Palette.grey),
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
                          labelText: 'Password',
                          //lable style
                          labelStyle: TextStyle(
                            color: Palette.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                        validator: (text) {
                          if(text!.isEmpty){
                            return 'Enter password';
                          }
                          // else if (passwordController.length < 8) {
                          //   return 'password should be 8 digits';
                          // }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.h,),
                      Align(
                          alignment: Alignment.center,
                          child: TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                          }, child: Text('Forgot Password?',style: TextStyle(color: Color(0xff252525),fontSize: 14.sp),),)),

                      ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            Provider.of<AuthProvider>(context,listen: false).signin(emailController.text, passwordController.text, context);
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
                              'Sign In',
                              style:
                              TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600 ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Container(
                              width: 110.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 0,
                                    blurRadius: 9,
                                    offset: Offset(1, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset("assets/icons/google.png",height: 25.h,width: 25.w,),
                                  Text("Google",style: TextStyle(
                                    fontSize: 15.sp,
                                  ),),
                                ],
                              ),

                            ),
                            onTap: (){
                              final provider =Provider.of<GoogleSignInProvider>(context,listen: false);
                              provider.googleLogin(context);
                            },

                          ),
                          SizedBox(width: 10.h),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Container(
                                width: 110.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 0,
                                      blurRadius: 9,
                                      offset: Offset(1, 3),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset("assets/icons/facebooklogo.png",height: 25.h,width: 25.w,),
                                    Text("Facebook",style: TextStyle(
                                      fontSize: 15.sp,
                                    ),),

                                  ],
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Don’t have an account?',style: TextStyle(color: Color(0xff000000),fontSize: 16.sp),),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                          }, child: Text('Sign Up',style: TextStyle(color: Color(0xff0179A3),fontSize: 16.sp),),)
                        ],
                      )
                    ],
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
