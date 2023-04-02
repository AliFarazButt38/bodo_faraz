import 'package:bodoo_flutter/Views/Pages/notifications_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController textField1Controller = TextEditingController();

final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController=TextEditingController();
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
    return Scaffold(
      body: SafeArea(child:
      Stack(
        children: [
          Column(
            children: [
              Container(
                height: 347.h,
                width:428.w,
                decoration: const BoxDecoration(
                  // color: Colors.blueAccent,
                  gradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0.w,right: 20.0.w,top: 50.h),
                  child: Row(
                    mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text("Profile",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),),
                      InkWell(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                         },
                        child: Padding(
                          padding:  EdgeInsets.only(top: 6.h),
                          child: Image.asset('assets/icons/notification.png',height: 20.h,width: 19.w,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Positioned.fill(
            top: 150,
            child: Container(
              height: 736.h,
              width: 428.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
                color: Colors.white,
              ),
            child: Padding(
              padding:  EdgeInsets.only(top: 70.h,left: 15.w,right: 15.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("James Thomas",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22.sp),),
                    Text("Level 2 - Grade 3",style: TextStyle(fontSize: 16.sp),),
                       SizedBox(height: 20.h,),
                    TextFormField(
                      controller: textField1Controller,
                      decoration: InputDecoration(
                        labelText: 'Reference Link',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.sp,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        suffixIcon: Padding(
                          padding:  EdgeInsets.only(right: 15.w),
                          child: Container(
                              height: 20.h,
                              width: 20.w,
                              child: Image.asset("assets/icons/forward.png",)),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 10.w),
                          child: Text("Personal Information",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),),
                        ),
                        Form
                          (
                          key: _formKey,
                          child: Padding(
                            padding:  EdgeInsets.only(top: 20.h,),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextFormField(
                                  controller: nameController,
                                  style: TextStyle(
                                    color: Colors.grey,
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

                                    // errorText: _errorMsg,
                                    //  disabledBorder: OutlineInputBorder(
                                    //    borderSide: const BorderSide(color: Palette.grey),
                                    //    borderRadius: BorderRadius.circular(10),
                                    //  ),
                                    border:  OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color:  Colors.blueAccent),
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
                                    fillColor: Colors.grey,

                                    hintText: "Name",

                                    //make hint text
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.sp,
                                    ),

                                    //create lable
                                    labelText: 'Name',
                                    //lable style
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
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
                                    color: Colors.grey,
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


                                    // errorText: _errorMsg,
                                    //  disabledBorder: OutlineInputBorder(
                                    //    borderSide: const BorderSide(color: Palette.grey),
                                    //    borderRadius: BorderRadius.circular(10),
                                    //  ),
                                    border:  OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.blueAccent),
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
                                    fillColor: Colors.grey,

                                    hintText: "Email",

                                    //make hint text
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.sp,
                                    ),

                                    //create lable
                                    labelText: 'Email',
                                    //lable style
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  validator: validateEmail,
                                ),
                                SizedBox(height: 15.h,),
                                TextFormField(
                                  controller: contactController,
                                  style: TextStyle(
                                    color: Colors.grey,
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


                                    // errorText: _errorMsg,
                                    //  disabledBorder: OutlineInputBorder(
                                    //    borderSide: const BorderSide(color: Palette.grey),
                                    //    borderRadius: BorderRadius.circular(10),
                                    //  ),
                                    border:  OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.blueAccent),
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
                                    fillColor: Colors.grey,

                                    hintText: "Contact No",

                                    //make hint text
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.sp,
                                    ),

                                    //create lable
                                    labelText: 'Contact No',
                                    //lable style
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            ),
          ),

          Positioned(
              top: 110,
              left: 160,
              child:
              Image(image:
              AssetImage("assets/images/Profile1.png"),height: 100.h,width: 100.h,)

          ),
        ],
      ),
      ),
    );
  }
}
