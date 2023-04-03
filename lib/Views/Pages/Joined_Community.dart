import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_stack/image_stack.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../Theme/palette.dart';
import 'notifications_Screen.dart';
List<String> images = ["assets/images/profile.png", "assets/images/profile.png", "assets/images/profile.png", "assets/images/profile.png","assets/images/profile.png", "assets/images/profile.png"];



class JoinedCommunity extends StatefulWidget {
  const JoinedCommunity({Key? key}) : super(key: key);

  @override
  State<JoinedCommunity> createState() => _JoinedCommunityState();
}

class _JoinedCommunityState extends State<JoinedCommunity> {

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
                      Text("Community",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),),
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
              height: 780.h,
              width: 428.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 30.h,left: 80.w),
                      child: Text("Following are the part of your community",style: TextStyle(color: Colors.grey,fontSize: 14.sp),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.w),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 8, // replace with the number of items you want to display
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:  EdgeInsets.only(top: 20.0.h),
                            child: Column(

                              children: [
                                Row(
                                  children: <Widget>[
                                    Stack(
                                      children: [
                                        Container(
                                          height: 60.h,
                                          width: 60.w,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage('assets/images/profile.png'),
                                                  fit: BoxFit.fill,
                                                  filterQuality: FilterQuality.high
                                              )
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: SvgPicture.asset(
                                            'assets/icons/fav.svg',
                                            semanticsLabel: 'A red up arrow',
                                            width: 20.w,
                                            height: 20.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10.h,),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: <Widget>[
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text('John Doe', style: TextStyle(color: Palette.black,fontSize: 16.sp,fontWeight: FontWeight.bold),),
                                                  Text('Level 1 - Grade 1', style: TextStyle(color: Palette.grey74,fontSize: 14.sp,),),

                                                ],
                                              ),
                                              SizedBox(width: 32.w,),
                                              ImageStack(
                                                imageList: images,
                                                totalCount: images.length, // If larger than images.length, will show extra empty circle
                                                imageRadius: 32, // Radius of each images
                                                imageCount: 3, // Maximum number of images to be shown in stack
                                                imageBorderWidth: 3, // Border width around the images
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5.h,),
                                          LinearPercentIndicator(
                                            barRadius: Radius.circular(15.0),
                                            width: 200,
                                            animation: true,
                                            lineHeight: 8,
                                            percent: 0.7,
                                            // progressColor: Colors.blueAccent,
                                            linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                                            backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 3.h,),
                                Padding(
                                  padding:  EdgeInsets.only(right: 20.w),
                                  child: Divider(
                                    thickness: 1,

                                  ),
                                ),
                              ],
                            ),
                          );

                        },
                      ),
                    ),

                  ],
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
