import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'notifications_Screen.dart';

class InviteFriends extends StatefulWidget {
  const InviteFriends({Key? key}) : super(key: key);

  @override
  State<InviteFriends> createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  TextEditingController refrenceController = TextEditingController();
  TextEditingController tokenController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refrenceController = TextEditingController(text: Provider.of<AuthProvider>(context,listen: false).inviteUrl);
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
                  padding:  EdgeInsets.only(left: 20.0.w,right: 20.0.w,top: 50.h),
                  child: Row(
                    mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child:Image.asset("assets/icons/backward.png",height: 30.h,width: 30.w,),
                      ),

                      Text("Invite Friends",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),),
                      InkWell
                        (
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
            top: 140,
            child: Container(
              height: 731.h,
              width: 428.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
                color: Colors.white,
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: 80.h),

                child:SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("Invite your Friends",style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w600),),
                      SizedBox(height: 5.h,),
                      Text("Invite & earn points",style: TextStyle(fontSize: 16.sp),),
                      SizedBox(height: 10.h,),
                      Image.asset("assets/images/gift.png",height:155.84.h,width: 179.93.w,),
                      Padding(
                        padding:  EdgeInsets.only(left: 20.w,right: 20.w),
                        child: Column(
                          children: [
                            TextFormField(
                              readOnly: true,
                              controller: refrenceController,
                              decoration: InputDecoration(
                                labelText: 'Reference Link',
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
                                      height: 19.h,
                                      width: 20.w,
                                      child: Image.asset("assets/icons/forward.png",)),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            TextFormField(
                              controller: tokenController,
                              decoration: InputDecoration(
                                labelText: 'Token No',
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
                                    width: 20.h,
                                    child: Image.asset("assets/icons/copy.png"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30.h,),
                            Text("Share your referral code via",style: TextStyle(color: Colors.black,fontSize: 16.sp),),
                          ],
                        ),
                      ),

                     SizedBox(height: 30.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 110.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("assets/icons/whatsApp.png",height: 24.49.h,width: 24.39.w,),

                                Text("WhatsApp",style: TextStyle(fontSize: 12.sp),),
                              ],
                            ),
                          ),

                          Container(
                            width: 110.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("assets/icons/facebook.png",height: 24.49.h,width: 24.39.w,),

                                Text("facebook",style: TextStyle(fontSize: 12.sp)),
                              ],
                            ),
                          ),

                          Container(
                            width: 110.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("assets/icons/telegram.png",height: 24.49.h,width: 24.39.w,),

                                Text("telegram",style: TextStyle(fontSize: 12.sp)),
                              ],
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
            top: 100,
            left: 18,
            child: Container(
              width: 388.w,
              height: 90.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 9,
                    offset: Offset(1, 3),
                  ),
                ],
              ),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Invite Friends",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                            Text("41/60",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w600),),
                          ],
                        ),

                        Padding(
                          padding:  EdgeInsets.only(top: 10.h),
                          child: LinearPercentIndicator(
                            barRadius: Radius.circular(15.0),
                            animation: true,
                            lineHeight: 12,
                            percent: 0.7,
                            // progressColor: Colors.blueAccent,
                            linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                            backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // subtitle: Padding(
                  //   padding: const EdgeInsets.only(top: 20),
                  //   child: Column(
                  //     children: [
                  //       LinearPercentIndicator(
                  //         barRadius: Radius.circular(15.0),
                  //         animation: true,
                  //         lineHeight: 12,
                  //         percent: 0.7,
                  //         // progressColor: Colors.blueAccent,
                  //         linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                  //         backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,
                  //       ),
                  //       SizedBox(height: 5,),
                  //       Text("Watch Videos to Earn points",style: TextStyle(color: Colors.grey,fontSize: 15)),
                  //     ],
                  //   ),
                  // ),

                  leading: Padding(
                    padding:  EdgeInsets.only(left: 10.0.w,top: 12.0.h),
                    child: Column(
                      children:  [
                    Image.asset("assets/icons/invite.png",width: 22.w,height: 16.h,),
                      ],

                    ),
                  ),


                  onTap: () {
                  },
                ),
              ),

            ),
          ),



        ],
      ),
      ),
    );
  }
}
