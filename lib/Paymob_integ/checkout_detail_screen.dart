import 'package:bodoo_flutter/Paymob_integ/payment_provider.dart';
import 'package:bodoo_flutter/Paymob_integ/toogle_screen.dart';
import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:bodoo_flutter/Theme/style.dart';
import 'package:bodoo_flutter/Views/Pages/dashboard.dart';
import 'package:bodoo_flutter/Views/Pages/facebook_auth.dart';
import 'package:bodoo_flutter/Views/Pages/forgot_password.dart';
import 'package:bodoo_flutter/Views/Pages/signup.dart';
import 'package:bodoo_flutter/Views/Pages/userdetails_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../Providers/Google_SignInProvider.dart';
import '../../Theme/palette.dart';
import '../../Utils/screen_config.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class CheckoutDetailScreen extends StatefulWidget {
  const CheckoutDetailScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutDetailScreen> createState() => _CheckoutDetailScreenState();
}

class _CheckoutDetailScreenState extends State<CheckoutDetailScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PaymentProvider>(context,listen: false).getAuthToken();
  }

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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/signin_pic.svg',
                semanticsLabel: 'A red up arrow',
                height: 294.h,
                width: 294.h,
              ),


              Padding(
                padding: EdgeInsets.only(left: 20.0.w,right: 20.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: firstNameController,
                        keyboardType: TextInputType.name,
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

                          hintText: "First Name",

                          //make hint text
                          hintStyle: TextStyle(
                            color: Palette.grey,
                            fontSize: 14.sp,
                          ),

                          //create lable
                          labelText: 'First Name',
                          //lable style
                          labelStyle: TextStyle(
                            color: Palette.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                        validator: (text) {
                          if(text!.isEmpty){
                            return 'Enter First Name';
                          }
                          // else if (passwordController.length < 8) {
                          //   return 'password should be 8 digits';
                          // }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h,),
                      TextFormField(
                        controller: lastNameController,
                        keyboardType: TextInputType.name,
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

                          hintText: "Last Name",

                          //make hint text
                          hintStyle: TextStyle(
                            color: Palette.grey,
                            fontSize: 14.sp,
                          ),

                          //create lable
                          labelText: 'Last Name',
                          //lable style
                          labelStyle: TextStyle(
                            color: Palette.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                        validator: (text) {
                          if(text!.isEmpty){
                            return 'Enter Last Name';
                          }
                          // else if (passwordController.length < 8) {
                          //   return 'password should be 8 digits';
                          // }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h,),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
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
                        controller: phoneController,
                        keyboardType: TextInputType.number,
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

                          hintText: "Phone",

                          //make hint text
                          hintStyle: TextStyle(
                            color: Palette.grey,
                            fontSize: 14.sp,
                          ),

                          //create lable
                          labelText: 'Phone',
                          //lable style
                          labelStyle: TextStyle(
                            color: Palette.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                        validator: (text) {
                          if(text!.isEmpty){
                            return 'Enter Phone number';
                          }
                          // else if (passwordController.length < 8) {
                          //   return 'password should be 8 digits';
                          // }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h,),
                      TextFormField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
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

                          hintText: "Price",

                          //make hint text
                          hintStyle: TextStyle(
                            color: Palette.grey,
                            fontSize: 14.sp,
                          ),

                          //create lable
                          labelText: 'Price',
                          //lable style
                          labelStyle: TextStyle(
                            color: Palette.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                        validator: (text) {
                          if(text!.isEmpty){
                            return 'Enter Price';
                          }
                          // else if (passwordController.length < 8) {
                          //   return 'password should be 8 digits';
                          // }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.h,),

                      ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                           // Provider.of<AuthProvider>(context,listen: false).signin(emailController.text, phoneController.text, context);
                            //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
                         //Navigator.push(context, MaterialPageRoute(builder: (context) => ToogleScreen()));
                            Provider.of<PaymentProvider>(context,listen: false).getPaymentKey(emailController.text,phoneController.text,firstNameController.text,lastNameController.text,priceController.text);
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
                              'Submit',
                              style:
                              TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600 ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h,),

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
