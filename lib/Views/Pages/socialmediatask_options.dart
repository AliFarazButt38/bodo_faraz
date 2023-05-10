
import 'package:bodoo_flutter/Providers/level_provider.dart';
import 'package:bodoo_flutter/Views/Pages/ad_mob.dart';
import 'package:bodoo_flutter/Views/Pages/facebooktask_screen.dart';
import 'package:bodoo_flutter/Views/Pages/instagramtask_screen.dart';
import 'package:bodoo_flutter/Views/Pages/watch_videoScreen.dart';
import 'package:bodoo_flutter/Views/Pages/write_Areview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'notifications_Screen.dart';

class SocialMediaOptions extends StatefulWidget {
  const SocialMediaOptions({Key? key}) : super(key: key);

  @override
  State<SocialMediaOptions> createState() => _SocialMediaOptionsState();
}

class _SocialMediaOptionsState extends State<SocialMediaOptions> {
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
                  height: 500,
                  width:MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    // color: Colors.blueAccent,
                    gradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child:ImageIcon(AssetImage("assets/icons/backward.png",),size: 30,color: Colors.white,),
                          ),

                          Text("Social Media Tasks",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                          InkWell
                            (
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                              },
                              child: ImageIcon(AssetImage('assets/icons/notification.png',),size: 25,color: Colors.white,)),
                        ],
                      ),
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
                child: Consumer<LevelProvider>(

                    builder: (context, levelProvider, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 25.w,top: 30.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Social Media Tasks",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 18.sp),),
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
                                  width: 390,
                                  height: 90,
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
                                        padding: const EdgeInsets.only(bottom: 13),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children:  [
                                            Text("Instagram tasks",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                                            Text("${levelProvider.completedVideos}/${levelProvider.totalVideos}"),
                                          ],
                                        ),
                                      ),
                                      subtitle: LinearPercentIndicator(
                                        barRadius: Radius.circular(15.0),
                                        animation: true,
                                        lineHeight: 12,
                                        percent: levelProvider.totalVideos == 0 ?  levelProvider.completedVideos/1 : levelProvider.completedVideos/levelProvider.totalVideos,

                                        // progressColor: Colors.blueAccent,
                                        linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                                        backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,


                                      ),
                                      leading: Padding(
                                        padding: const EdgeInsets.only(left: 10.0,top: 18.0),
                                        child: Column(
                                          children: const [
                                            ImageIcon(AssetImage('assets/icons/video.png',),size: 25,color: Colors.black,),
                                          ],
                                        ),
                                      ),

                                      trailing: Padding(
                                        padding: const EdgeInsets.only(left: 10.0,top: 18.0),
                                        child: Column(
                                          children: const [
                                            ImageIcon(AssetImage('assets/icons/next.png',),size: 22,color: Colors.black,),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>InstagramTask()));
                                      },
                                    ),
                                  ),
                                ),
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>WatchVideo()));
                                SizedBox(height: 10.h),
                                Container(
                                  width: 390,
                                  height: 90,
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
                                        padding: const EdgeInsets.only(bottom: 13),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text("Facebook tasks",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                                            Text("41/60"),
                                          ],
                                        ),
                                      ),
                                      subtitle: LinearPercentIndicator(
                                        barRadius: Radius.circular(15.0),
                                        animation: true,
                                        lineHeight: 12,
                                        percent: 0.7,
                                        // progressColor: Colors.blueAccent,
                                        linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                                        backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,


                                      ),
                                      leading: Padding(
                                        padding: const EdgeInsets.only(left: 10.0,top: 18.0),
                                        child: Column(
                                          children: const [
                                            ImageIcon(AssetImage('assets/icons/review.png',),size: 21,color: Colors.black,),
                                          ],
                                        ),
                                      ),

                                      trailing: Padding(
                                        padding: const EdgeInsets.only(left: 10.0,top: 18.0),
                                        child: Column(
                                          children: const [
                                            ImageIcon(AssetImage('assets/icons/next.png',),size: 22,color: Colors.black,),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FacebookTask()));

                                      },
                                    ),
                                  ),
                                ),
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>WriteReview()));

                              ],
                            ),
                          ),
                        ],
                      );
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
