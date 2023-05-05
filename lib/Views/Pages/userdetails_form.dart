import 'package:country_picker/country_picker.dart';
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
import 'package:intl/intl.dart';

class UserDetailsForm extends StatefulWidget {
  const UserDetailsForm({Key? key}) : super(key: key);

  @override
  State<UserDetailsForm> createState() => _UserDetailsFormState();
}

class _UserDetailsFormState extends State<UserDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController referalController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController instagramController = TextEditingController();

  DateTime? _selectedDate;
  final DateFormat _dateFormat = DateFormat('yyyy/MM/dd');
  Country _selectedCountry=Country
    (phoneCode: '+20', countryCode: 'EG',
      e164Sc: 20 , level: 2,
      name: 'Egypt', example:'+201234567890',
      displayName: 'egypt', displayNameNoCountryCode: 'Egypt(+20)',
      e164Key: '20', geographic: false);

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
                  padding:  EdgeInsets.only(left: 20.0.w,bottom: 20.h,top: 30.h),
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
                  padding:  EdgeInsets.only(left: 20.0.w,right: 20.w,top: 15.h),
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
                        InkWell(
                          onTap: () async {
                            final DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(3000),
                            );
                            if (selectedDate != null) {
                              setState(() {
                                _selectedDate = selectedDate;
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Palette.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.transparent,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start, // aligns children to start
                              children: [
                                IconButton(
                                  icon: Icon(Icons.calendar_month,color: Palette.grey,),
                                  onPressed: () async {
                                  //   final DateTime? selectedDate = await showDatePicker(
                                  //     context: context,
                                  //     initialDate: DateTime.now(),
                                  //     firstDate: DateTime(1900),
                                  //     lastDate: DateTime(3000),
                                  //   );
                                  //   if (selectedDate != null) {
                                  //     setState(() {
                                  //       _selectedDate = selectedDate;
                                  //     });
                                  //   }
                                   },
                                ),
                                Text(
                                  _selectedDate == null ? 'Date of birth' : _dateFormat.format(_selectedDate!),
                                  style: TextStyle(
                                    fontSize: 16.0.sp,
                                    color: Palette.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                        SizedBox(height: 15.h,),
                        // TextFormField(
                        //   controller: countryController,
                        //   style: TextStyle(
                        //     color: Palette.grey,
                        //     fontSize: 14,
                        //   ),
                        //   // onChanged: (value) {
                        //   //   setState(() {
                        //   //     emailController.text = value.toString();
                        //   //   });
                        //   // },
                        //   decoration: InputDecoration(
                        //     focusColor: Colors.white,
                        //     //add prefix icon
                        //     prefixIcon: Padding(
                        //       padding: const EdgeInsets.all(10.0),
                        //       child: SvgPicture.asset(
                        //         'assets/icons/File.svg',
                        //         semanticsLabel: 'A red up arrow',
                        //       ),
                        //     ),
                        //
                        //     // errorText: _errorMsg,
                        //     //  disabledBorder: OutlineInputBorder(
                        //     //    borderSide: const BorderSide(color: Palette.grey),
                        //     //    borderRadius: BorderRadius.circular(10),
                        //     //  ),
                        //     border:  OutlineInputBorder(
                        //       borderSide: const BorderSide(color: Palette.black),
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //
                        //     focusedBorder: OutlineInputBorder(
                        //       borderSide: const BorderSide(color: Palette.grey),
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderSide: const BorderSide(color: Palette.grey),
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     errorBorder: OutlineInputBorder(
                        //       borderSide: const BorderSide(color: Colors.red),
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     focusedErrorBorder: OutlineInputBorder(
                        //       borderSide: const BorderSide(color: Colors.red),
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     fillColor: Palette.grey,
                        //
                        //     hintText: "Country",
                        //
                        //     //make hint text
                        //     hintStyle: TextStyle(
                        //       color: Palette.grey,
                        //       fontSize: 14.sp,
                        //     ),
                        //
                        //     //create lable
                        //     labelText: 'Country',
                        //     //lable style
                        //     labelStyle: TextStyle(
                        //       color: Palette.grey,
                        //       fontSize: 14.sp,
                        //     ),
                        //   ),
                        //   validator: (text) {
                        //     if(text!.isEmpty){
                        //       return 'Enter country';
                        //     }
                        //     // else if (passwordController.length < 8) {
                        //     //   return 'password should be 8 digits';
                        //     // }
                        //     return null;
                        //   },
                        // ),

                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Country',
                            labelStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 16.0,

                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Palette.grey),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Palette.grey),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: false,

                                  onSelect: (Country country) {
                                    setState(() {
                                      _selectedCountry = country;
                                    });
                                  },
                                );
                              },
                              icon: Icon(Icons.arrow_drop_down),
                              color: Colors.grey,
                            ),
                          ),
                          controller: TextEditingController(
                            text: _selectedCountry == null ? '' : _selectedCountry.name,
                          ),
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showPhoneCode: false,
                              onSelect: (Country country) {
                                setState(() {
                                  _selectedCountry = country;
                                });
                              },
                            );
                          },
                          readOnly: true,
                        ),


                        SizedBox(height: 15.h,),
                        TextFormField(
                          controller: cityController,
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

                            hintText: "City",

                            //make hint text
                            hintStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 14.sp,
                            ),

                            //create lable
                            labelText: 'City',
                            //lable style
                            labelStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                          validator: (text) {
                            if(text!.isEmpty){
                              return 'Enter City';
                            }
                            // else if (passwordController.length < 8) {
                            //   return 'password should be 8 digits';
                            // }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.h,),
                        TextFormField(
                          controller: facebookController,
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

                            hintText: "facebook_profile_url",

                            //make hint text
                            hintStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 14.sp,
                            ),

                            //create lable
                            labelText: 'facebook_profile_url',
                            //lable style
                            labelStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                          validator: (text) {
                            if(text!.isEmpty){
                              return 'Enter facebook profile url';
                            }
                            // else if (passwordController.length < 8) {
                            //   return 'password should be 8 digits';
                            // }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.h,),
                        TextFormField(
                          controller: instagramController,
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

                            hintText: "instagram_username",

                            //make hint text
                            hintStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 14.sp,
                            ),

                            //create lable
                            labelText: 'instagram_username',
                            //lable style
                            labelStyle: TextStyle(
                              color: Palette.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                          validator: (text) {
                            if(text!.isEmpty){
                              return 'Enter instagram username';
                            }
                            // else if (passwordController.length < 8) {
                            //   return 'password should be 8 digits';
                            // }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.h,),
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
                        // Provider.of<AuthProvider>(context,listen: false).signup(nameController.text, emailController.text, "", referalController.text,phoneController.text,'${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}',countryController.text,cityController.text,facebookController.text,instagramController.text,context);
                     Provider.of<AuthProvider>(context,listen: false).userdtails(nameController.text,  referalController.text, phoneController.text,'${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}', countryController.text, cityController.text, facebookController.text, instagramController.text, context);
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
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
