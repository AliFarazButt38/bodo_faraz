
import 'package:bodoo_flutter/Views/Pages/watch_videoScreen.dart';
import 'package:bodoo_flutter/Views/Pages/write_Areview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'download_appScreen.dart';
import 'notifications_Screen.dart';

class CategoryVideos extends StatefulWidget {
  const CategoryVideos({Key? key}) : super(key: key);

  @override
  State<CategoryVideos> createState() => _CategoryVideosState();
}

class _CategoryVideosState extends State<CategoryVideos> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
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
                    padding: EdgeInsets.only(top: 50.h,left: 20.w,right: 20.w),
                    child: Row(
                      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:
                          Image.asset("assets/icons/backward.png",height: 25.h,width: 25.w,),

                        ),
                        Text("Watch Videos",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),),
                        InkWell
                          (
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                          },
                          child: Image.asset("assets/icons/notification.png",height: 20.h,width: 19.w,),

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
                    Padding(
                      padding:  EdgeInsets.only(left: 25.w,top: 30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Watch Videos",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 18.sp),),
                          SizedBox(height: 5.h),
                          Text("Complete the following number of tasks",style: TextStyle(color:Colors.grey,fontSize: 16.sp),),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Padding(
                      padding:  EdgeInsets.only(left: 20.w,right: 10.w),
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          Container(
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WatchVideo()));
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
                                  padding:  EdgeInsets.only(bottom: 10.h),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10.h,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:  [
                                          Text("Watch add",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),
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
                                      Image.asset("assets/icons/review.png",height:21.h ,width: 21.w,color: Colors.black,),
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
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>WriteReview()));
                                },
                              ),
                            ),
                          ),

                        ],
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
