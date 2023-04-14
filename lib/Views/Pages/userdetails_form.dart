import 'package:flutter/material.dart';
import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:bodoo_flutter/Views/Pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../Providers/Google_SignInProvider.dart';
import '../../Theme/palette.dart';
import '../../Theme/style.dart';
import '../../Utils/screen_config.dart';

class UserDetailsForm extends StatefulWidget {
  const UserDetailsForm({Key? key}) : super(key: key);

  @override
  State<UserDetailsForm> createState() => _UserDetailsFormState();
}

class _UserDetailsFormState extends State<UserDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController facebookController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController referalController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
      body: SafeArea(
        child: SizedBox(
          height: ScreenConfig.screenHeight,
          width: ScreenConfig.screenWidth,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // Padding(
                //   padding:  EdgeInsets.only(top: 40.h,left:100.0.w,right: 67.w),
                //   child: SvgPicture.asset(
                //     'assets/images/signup_pic.svg',
                //     semanticsLabel: 'A red up arrow',
                //     height: 219.h,
                //     width: 219.w,
                //   ),
                // ),
                //SizedBox(height: 18,),
                Padding(
                  padding:  EdgeInsets.only(left: 20.0.w,bottom: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('User Details',style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10.h,),
                      Text('User Details Form',style: TextStyle(color: Palette.grey,fontSize: 16.sp),),
                    ],
                  ),
                ),
                //SizedBox(height: 30,),
                Padding(
                  padding:  EdgeInsets.only(left: 20.0.w,right: 20.w,top: 20.h),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        TextFormField(
                          controller: nameController,
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
                              padding:  EdgeInsets.all(10.0),
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

                            hintText: "Name",

                            //make hint text
                            hintStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 14.sp,
                            ),

                            //create lable
                            labelText: 'Name',
                            //lable style
                            labelStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                          validator:(text) {
                            if(text!.isEmpty){
                              return 'enter name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.h,),
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
                              padding:  EdgeInsets.all(10.0),
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
                        SizedBox(height: 15.h,),
                        TextFormField(
                          controller: instagramController,
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
                              padding:  EdgeInsets.all(10.0),
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

                            hintText: "instagram",

                            //make hint text
                            hintStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 14.sp,
                            ),

                            //create lable
                            labelText: 'instagram',
                            //lable style
                            labelStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                          validator:(text) {
                            if(text!.isEmpty){
                              return 'enter link';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.h,),
                        TextFormField(
                          controller: facebookController,
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
                              padding:  EdgeInsets.all(10.0),
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

                            hintText: "facebook",

                            //make hint text
                            hintStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 14.sp,
                            ),

                            //create lable
                            labelText: 'facebook',
                            //lable style
                            labelStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                          validator:(text) {
                            if(text!.isEmpty){
                              return 'enter link';
                            }
                            return null;
                          },
                        ),
                        // SizedBox(height: 30,),
                        SizedBox(height: 15.h,),
                        TextFormField(
                          controller: cityController,
                          obscureText: false,
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

                            hintText: "City Name",

                            //make hint text
                            hintStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 14.sp,
                            ),

                            //create lable
                            labelText: 'City Name',
                            //lable style
                            labelStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                          validator: (text) {
                            if(text!.isEmpty){
                              return 'enter city name';
                            }
                            // else if (passwordController.length < 8) {
                            //   return 'password should be 8 digits';
                            // }
                            return null;
                          },
                        ),

                        SizedBox(height: 15.h,),

                        TextFormField(
                          controller: phoneController,
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

                            hintText: "Phone Number",

                            //make hint text
                            hintStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 14,
                            ),

                            //create lable
                            labelText: 'Phone Number',
                            //lable style
                            labelStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 14,
                            ),
                          ),
                          validator: (text) {
                            if(text!.isEmpty){
                              return 'Enter Referal code';
                            }
                            else if (text.length != 11) {
                              return 'number should be 11 digits';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: referalController,
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
                                'assets/icons/File.svg',
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

                            hintText: "Referal code",

                            //make hint text
                            hintStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 14.sp,
                            ),

                            //create lable
                            labelText: 'Referal code',
                            //lable style
                            labelStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                          validator: (text) {
                            if(text!.isEmpty){
                              return 'Enter Referal code';
                            }
                            // else if (passwordController.length < 8) {
                            //   return 'password should be 8 digits';
                            // }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h,left: 20.0.w,right: 20.w),
                  child: ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
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
                          'Sign Up',
                          style:
                          TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600 ),
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 10.h,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     GestureDetector(
                //       child: Container(
                //         width: 110.w,
                //         height: 50.h,
                //         decoration: BoxDecoration(
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.black.withOpacity(0.1),
                //               spreadRadius: 0,
                //               blurRadius: 9,
                //               offset: Offset(1, 3),
                //             ),
                //           ],
                //           borderRadius: BorderRadius.circular(15),
                //           color: Colors.white,
                //         ),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           children: [
                //             Image.asset("assets/icons/google.png",height: 25.h,width: 25.w,),
                //             Text("Google",style: TextStyle(
                //               fontSize: 15.sp,
                //             ),),
                //           ],
                //         ),
                //
                //       ),
                //       onTap: () {
                //         final provider =Provider.of<GoogleSignInProvider>(context,listen: false);
                //         provider.googleLogin();
                //       },
                //     ),
                //     SizedBox(width: 10.h), // add some spacing between the containers
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Container(
                //         width: 110.w,
                //         height: 50.h,
                //         decoration: BoxDecoration(
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.black.withOpacity(0.1),
                //               spreadRadius: 0,
                //               blurRadius: 9,
                //               offset: Offset(1, 3),
                //             ),
                //           ],
                //           borderRadius: BorderRadius.circular(15),
                //           color: Colors.white,
                //         ),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //           children: [
                //             Image.asset("assets/icons/facebooklogo.png",height: 25.h,width: 25.w,),
                //             Text("Facebook",style: TextStyle(
                //               fontSize: 15.sp,
                //             ),),
                //
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 15.h,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Text('Already have an account?',style: TextStyle(color: Color(0xff000000),fontSize: 16.sp),),
                //     TextButton(onPressed: (){
                //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signin()));
                //     }, child: Text('Sign In',style: TextStyle(color: Color(0xff0179A3),fontSize: 16.sp),),)
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
