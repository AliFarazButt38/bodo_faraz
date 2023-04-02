
import 'package:bodoo_flutter/Providers/survey_provider.dart';
import 'package:bodoo_flutter/Views/Pages/category_videos.dart';
import 'package:bodoo_flutter/Views/Pages/social_mediaScreen.dart';
import 'package:bodoo_flutter/Views/Pages/surveys_screen.dart';
import 'package:bodoo_flutter/Views/Pages/watch_videoScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/auth_provider.dart';
import 'invite_friendsScreen.dart';
import 'notifications_Screen.dart';
import 'others_taskScreen.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: Colors.white38,
      body: SafeArea(
          child: Stack(
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
                          Text("Task",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),),
                           InkWell
                             (
                             onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                             },
                               child: Image.asset('assets/icons/notification.png',height: 20.h,width: 19.w,),
                           ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned.fill(
                top: 120,
                child: Container(
                  width: 428.w,
                  height: 854.h,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),topRight:Radius.circular(20.0)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Padding(
                              padding:  EdgeInsets.only(left: 35.0.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text("Level 1",style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w600),),
                                  SizedBox(height: 10.h),
                                  Text("Complete 50 more task to\n reach level 2",style: TextStyle(color: Colors.grey,fontSize: 14.sp),),
                                ],
                              ),
                            ),
                          Padding(
                            padding: EdgeInsets.only(right: 20.w,top: 20.h),
                            child: Column(
                              children: [
                              CircularPercentIndicator(
                                backgroundColor: Colors.white,
                              radius: 45.0,
                              lineWidth: 10.0,
                              animation: true,
                              percent: 0.75,
                              center:  Text(
                                "145",
                                style:
                                 TextStyle(fontWeight: FontWeight.bold, fontSize: 25.11.sp),
                              ),
                                // progressColor:Colors.greenAccent,
                                linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                              ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding:  EdgeInsets.only(left: 20.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text("Task Categories",style: TextStyle(fontWeight: FontWeight.w600,fontSize:18.sp ),),
                           SizedBox(height: 5.h),
                            Text("Complete the following number of tasks",style: TextStyle(color: Colors.grey,fontSize: 16.sp),),
                          ],
                        ),
                      ),
                         SizedBox(height: 20.h),
                       SingleChildScrollView(
                         child: Padding(
                           padding:  EdgeInsets.only(left: 20.0.w,right: 10.w),
                           child: Column(
                             children: [
                               SizedBox(height: 10.h),
                               Container(
                             width: 388.w,
                             height: 90.h,
                             decoration: BoxDecoration(
                               boxShadow: [
                                 BoxShadow(
                                   color: Colors.black.withOpacity(0.03),
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
                                   padding:  EdgeInsets.only(bottom: 10.h),
                                   child: Column(
                                     children: [
                                       SizedBox(height: 10.h,),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children:  [
                                           Text("Watch Videos",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                                           Text("41/60",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w600),),
                                         ],
                                       ),
                                       SizedBox(height: 15.h,),
                                       LinearPercentIndicator(
                                         barRadius: Radius.circular(15.0),
                                         animation: true,
                                         lineHeight: 12,
                                         percent: 0.7,
                                         // progressColor: Colors.blueAccent,
                                         linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                                         backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,

                                       ),
                                     ],
                                   ),
                                 ),
                                 leading: Padding(
                                   padding:  EdgeInsets.only(left: 10.0.w,top: 18.0.h),
                                   child: Column(
                                     children:  [
                                       Image.asset("assets/icons/video.png",height:15.h ,width: 14.w,color: Colors.black,),
                                     ],
                                   ),
                                 ),

                                 trailing: Padding(
                                   padding:  EdgeInsets.only(left: 10.0.w,top: 18.0.h),
                                   child: Column(
                                     children:  [

                                       Padding(
                                         padding:  EdgeInsets.only(left: 20.w),
                                         child: Image.asset("assets/icons/next.png",height:15.h ,width: 14.w,color: Colors.black,),
                                       ),
                                     ],
                                   ),
                                 ),
                                 onTap: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryVideos()));
                                 },
                               ),
                             ),
                           ),
                               SizedBox(height: 10.h),
                               Container(
                                 width: 388.w,
                                 height: 90.h,
                                 decoration: BoxDecoration(
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.black.withOpacity(0.03),
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
                                       padding:  EdgeInsets.only(bottom: 10.h),
                                       child: Column(
                                         children: [
                                           SizedBox(height: 10.h,),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children:  [
                                               Text("Social Media Reacts",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                                               Text("41/60",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w600),),
                                             ],
                                           ),
                                           SizedBox(height: 15.h,),
                                           LinearPercentIndicator(
                                             barRadius: Radius.circular(15.0),
                                             animation: true,
                                             lineHeight: 12,
                                             percent: 0.7,
                                             // progressColor: Colors.blueAccent,
                                             linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                                             backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,

                                           ),
                                         ],
                                       ),
                                     ),
                                     leading: Padding(
                                       padding:  EdgeInsets.only(left: 10.0.w,top: 15.0.h),
                                       child: Column(
                                         children:  [
                                           Image.asset("assets/icons/social.png",height:18.h ,width: 20.w,color: Colors.black,),
                                         ],
                                       ),
                                     ),

                                     trailing: Padding(
                                       padding:  EdgeInsets.only(left: 10.0.w,top: 18.0.h),
                                       child: Column(
                                         children:  [

                                           Padding(
                                             padding:  EdgeInsets.only(left: 20.w),
                                             child: Image.asset("assets/icons/next.png",height:15.h ,width: 14.w,color: Colors.black,),
                                           ),
                                         ],
                                       ),
                                     ),
                                     onTap: () {
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=>SocialMedia()));                                       },
                                   ),
                                 ),
                               ),
                               SizedBox(height: 10.h),
                               Container(
                                 width: 388.w,
                                 height: 90.h,
                                 decoration: BoxDecoration(
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.black.withOpacity(0.03),
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
                                       padding:  EdgeInsets.only(bottom: 10.h),
                                       child: Column(
                                         children: [
                                           SizedBox(height: 10.h,),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children:  [
                                               Text("Surveys",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                                               Text("41/60",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w600),),
                                             ],
                                           ),
                                           SizedBox(height: 15.h,),
                                           LinearPercentIndicator(
                                             barRadius: Radius.circular(15.0),
                                             animation: true,
                                             lineHeight: 12,
                                             percent: 0.7,
                                             // progressColor: Colors.blueAccent,
                                             linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                                             backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,

                                           ),
                                         ],
                                       ),
                                     ),
                                     leading: Padding(
                                       padding:  EdgeInsets.only(left: 10.0.w,top: 15.0.h),
                                       child: Column(
                                         children:  [
                                           Image.asset("assets/icons/survey.png",height:20.h ,width: 17.w,color: Colors.black,),
                                         ],
                                       ),
                                     ),

                                     trailing: Padding(
                                       padding:  EdgeInsets.only(left: 10.0.w,top: 18.0.h),
                                       child: Column(
                                         children:  [

                                           Padding(
                                             padding:  EdgeInsets.only(left: 20.w),
                                             child: Image.asset("assets/icons/next.png",height:15.h ,width: 14.w,color: Colors.black,),
                                           ),
                                         ],
                                       ),
                                     ),
                                     onTap: () {
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Surveys()));                                       },
                                   ),
                                 ),
                               ),
                               SizedBox(height: 10.h),
                               Container(
                                 width: 388.w,
                                 height: 90.h,
                                 decoration: BoxDecoration(
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.black.withOpacity(0.03),
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
                                       padding:  EdgeInsets.only(bottom: 10.h),
                                       child: Column(
                                         children: [
                                           SizedBox(height: 10.h,),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children:  [
                                               Text("Invite Friends",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                                               Text("41/60",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w600),),
                                             ],
                                           ),
                                           SizedBox(height: 15.h,),
                                           LinearPercentIndicator(
                                             barRadius: Radius.circular(15.0),
                                             animation: true,
                                             lineHeight: 12,
                                             percent: 0.7,
                                             // progressColor: Colors.blueAccent,
                                             linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                                             backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,

                                           ),
                                         ],
                                       ),
                                     ),
                                     leading: Padding(
                                       padding:  EdgeInsets.only(left: 10.0.w,top: 18.0.h),
                                       child: Column(
                                         children:  [
                                           Image.asset("assets/icons/invite.png",height:16.h ,width: 22.w,color: Colors.black,),
                                         ],
                                       ),
                                     ),

                                     trailing: Padding(
                                       padding:  EdgeInsets.only(left: 10.0.w,top: 18.0.h),
                                       child: Column(
                                         children:  [

                                           Padding(
                                             padding:  EdgeInsets.only(left: 20.w),
                                             child: Image.asset("assets/icons/next.png",height:15.h ,width: 14.w,color: Colors.black,),
                                           ),
                                         ],
                                       ),
                                     ),
                                     onTap: () {
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=>InviteFriends()));                                       },
                                   ),
                                 ),
                               ),
                               SizedBox(height: 10.h),
                               Container(
                                 width: 388.w,
                                 height: 90.h,
                                 decoration: BoxDecoration(
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.black.withOpacity(0.03),
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
                                       padding:  EdgeInsets.only(bottom: 10.h),
                                       child: Column(
                                         children: [
                                           SizedBox(height: 10.h,),
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children:  [
                                               Text("Others",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                                               Text("41/60",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w600),),
                                             ],
                                           ),
                                           SizedBox(height: 15.h,),
                                           LinearPercentIndicator(
                                             barRadius: Radius.circular(15.0),
                                             animation: true,
                                             lineHeight: 12,
                                             percent: 0.7,
                                             // progressColor: Colors.blueAccent,
                                             linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                                             backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,

                                           ),
                                         ],
                                       ),
                                     ),
                                     leading: Padding(
                                       padding:  EdgeInsets.only(left: 10.0.w,top: 18.0.h),
                                       child: Column(
                                         children:  [
                                           Image.asset("assets/icons/others.png",height:20.h ,width: 20.w,color: Colors.black,),
                                         ],
                                       ),
                                     ),

                                     trailing: Padding(
                                       padding:  EdgeInsets.only(left: 10.0.w,top: 18.0.h),
                                       child: Column(
                                         children:  [

                                           Padding(
                                             padding: const EdgeInsets.only(left: 20),
                                             child: Image.asset("assets/icons/next.png",height:15.h ,width: 14.w,color: Colors.black,),
                                           ),
                                         ],
                                       ),
                                     ),
                                     onTap: () {
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=>OthersTask()));
                                     },
                                   ),
                                 ),
                               ),


                             ],
                           ),
                         ),
                       ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
    );
  }
}
