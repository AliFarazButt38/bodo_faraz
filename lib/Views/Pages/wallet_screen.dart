
import 'package:bodoo_flutter/Views/Pages/invite_friendsScreen.dart';
import 'package:bodoo_flutter/Views/Pages/social_mediaScreen.dart';
import 'package:bodoo_flutter/Views/Pages/surveys_screen.dart';
import 'package:bodoo_flutter/Views/Pages/watch_videoScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../Widgets/line_chart.dart';
import 'category_videos.dart';
import 'notifications_Screen.dart';
import 'others_taskScreen.dart';
class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _Wallet();
}

class _Wallet extends State<Wallet> {
  int _selectedIndex = 0;
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 1100));
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
                    padding:  EdgeInsets.only(left: 20.0.w,right: 20.0.w,top: 50.h),
                    child: Row(
                      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text("Wallet",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),),
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
              top: 120,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:  EdgeInsets.only(top: 30.h),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.w),
                          child: Container(
                            width: 378.w,
                            height: 190.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(color: Colors.grey, width: 1.0),
                                bottom: BorderSide(color: Colors.grey, width: 1.0),
                                left: BorderSide(color: Colors.grey, width: 1.0),
                                right: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Text("Available Points",style: TextStyle(color: Colors.grey,fontSize: 16.sp),),
                                SizedBox(height: 10.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(right: 8.0.w),
                                      child:Image.asset("assets/icons/staryellow.png",height: 20.h,width: 20.w,),
                                    ),

                                    Text("50,000",style: TextStyle(fontSize: 32.sp,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                SizedBox(height: 10.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Todays Earning",style: TextStyle(color: Colors.grey,fontSize:14.sp ),),
                                        SizedBox(height: 15.h,),
                                        Row(
                                          children: [
                                            Text("50,000",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.sp),),
                                            Padding(
                                              padding: EdgeInsets.only(left: 5.w),
                                              child: Text("EGP",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.bold),),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h,),
                                    Column(
                                      children: [
                                        Text("Total Earning",style: TextStyle(color: Colors.grey,fontSize:14.sp ),),
                                        SizedBox(height: 15.h,),
                                        Row(
                                          children: [
                                            Text("50,000",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.sp),),
                                            Padding(
                                              padding: EdgeInsets.only(left: 5.w),
                                              child: Text("EGP",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.bold),),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        Container(
                          height: 50.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: days.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  LineChartWidget();
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        days[index],
                                        style: TextStyle(
                                          color: _selectedIndex == index
                                              ? Colors.greenAccent
                                              : Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.02.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Container(
                                        height: 2.h,
                                        width: 30.w,
                                        decoration: BoxDecoration(
                                          color: _selectedIndex == index
                                              ? Colors.greenAccent
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        SizedBox(height: 10.h,),

                        Padding(
                          padding:  EdgeInsets.only(left: 10.w),
                          child: Container(
                            height: 209.h,
                            width: 400.w,
                            child: LineChartWidget(),
                          ),
                        ),

                        SizedBox(height: 15.h,),
                        Padding(
                          padding:  EdgeInsets.only(left: 20.w),
                          child: Text("Postponed Reward",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600),),
                        ),
                        SizedBox(height: 5.h,),
                        Padding(
                          padding:  EdgeInsets.only(left: 20.w),
                          child: Text("Reward from your network",style: TextStyle(fontSize: 16.sp, color:Colors.grey),),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 25.w,top: 10.h),
                          child: Container(
                            width: 378.w,
                            height: 190.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(color: Colors.grey, width: 1.0),
                                bottom: BorderSide(color: Colors.grey, width: 1.0),
                                left: BorderSide(color: Colors.grey, width: 1.0),
                                right: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Text("Points From Network",style: TextStyle(color: Colors.grey,fontSize: 16.sp),),
                                SizedBox(height: 10.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(right: 8.0.w),
                                      child:Image.asset("assets/icons/staryellow.png",height: 20.h,width: 20.w,),
                                    ),

                                    Text("50,000",style: TextStyle(fontSize: 32.sp,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                SizedBox(height: 30.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Postponed Reward",style: TextStyle(color: Colors.grey,fontSize:14.sp ),),
                                        SizedBox(height: 15.h,),
                                        Row(
                                          children: [
                                            Text("20,000",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.sp),),
                                            Padding(
                                              padding:  EdgeInsets.only(left: 5.w),
                                              child: Text("EGP",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.bold),),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h,),
                                    Column(
                                      children: [
                                        Text("Network Members",style: TextStyle(color: Colors.grey,fontSize:14.sp ),),
                                        SizedBox(height: 15.h,),
                                        Text("23",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.sp),),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 20),
                          child: Text("Task Detail",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600),),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Statement of your each task",style: TextStyle(fontSize: 16.sp, color:Colors.grey),),
                        ),
                        SizedBox(height: 10.h),





                        Padding(
                          padding:  EdgeInsets.only(left: 20.0.w,right: 10.w),
                          child: Column(
                            children: [
                              SizedBox(height: 10.h),
                              Container(
                                width: 388.w,
                                height: 92.h,
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
                                      padding:  EdgeInsets.only(left: 10.0.w,top: 30.0.h),
                                      child: Column(
                                        children:  [
                                          Image.asset("assets/icons/video.png",height:15.h ,width: 14.w,color: Colors.black,),
                                        ],
                                      ),
                                    ),

                                    trailing: Padding(
                                      padding:  EdgeInsets.only(left: 10.0.w,top: 30.0.h),
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
                                height: 92.h,
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
                                      padding:  EdgeInsets.only(left: 10.0.w,top: 30.0.h),
                                      child: Column(
                                        children:  [
                                          Image.asset("assets/icons/social.png",height:18.h ,width: 20.w,color: Colors.black,),
                                        ],
                                      ),
                                    ),

                                    trailing: Padding(
                                      padding:  EdgeInsets.only(left: 10.0.w,top: 30.0.h),
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
                                height: 92.h,
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
                                      padding:  EdgeInsets.only(left: 10.0.w,top: 30.0.h),
                                      child: Column(
                                        children:  [
                                          Image.asset("assets/icons/survey.png",height:20.h ,width: 17.w,color: Colors.black,),
                                        ],
                                      ),
                                    ),

                                    trailing: Padding(
                                      padding:  EdgeInsets.only(left: 10.0.w,top: 30.0.h),
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
                                height: 92.h,
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
                                      padding:  EdgeInsets.only(left: 10.0.w,top: 30.0.h),
                                      child: Column(
                                        children:  [
                                          Image.asset("assets/icons/invite.png",height:16.h ,width: 22.w,color: Colors.black,),
                                        ],
                                      ),
                                    ),

                                    trailing: Padding(
                                      padding:  EdgeInsets.only(left: 10.0.w,top: 30.0.h),
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
                                height: 92.h,
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
                                      padding:  EdgeInsets.only(left: 10.0.w,top: 30.0.h),
                                      child: Column(
                                        children:  [
                                          Image.asset("assets/icons/others.png",height:20.h ,width: 20.w,color: Colors.black,),
                                        ],
                                      ),
                                    ),

                                    trailing: Padding(
                                      padding:  EdgeInsets.only(left: 10.0.w,top: 30.0.h),
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




                      ],
                    ),

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


