
import 'package:bodoo_flutter/Views/Pages/startTask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'notifications_Screen.dart';

class ListItem {
  final String image;
  final String title;
  final String description;
  ListItem({
    required this.image,
    required this.title,
    required this.description,
  });
}
List<ListItem> items = [
  ListItem(
    image: "assets/images/SocialMedia2.png",
    title: "Add a Title to your Video",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it",
  ),
  ListItem(
    image: "assets/images/SocialMedia2.png",
    title: "Add a Title to your Video",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it",
  ),
  ListItem(
    image: "assets/images/SocialMedia2.png",
    title: "Add a Title to your Video",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it",
  ),
];


class SocialMedia extends StatefulWidget {
  const SocialMedia({Key? key}) : super(key: key);

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
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
                    padding:  EdgeInsets.only(top: 50.h,right: 20.w,left: 20.w),
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

                        Text("Social Media Tasks",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),),
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
                height: 735.h,
                width: 428.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:  EdgeInsets.only(top: 90.h,left: 20.w,right: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: items.length,
                          separatorBuilder: (BuildContext context,int index){
                            return SizedBox(height: 20.h,);
                          },// Replace itemCount with the actual number of list items you want to display
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (contex)=>StartTask()));
                              },
                              child: Container(
                                height: 346.h,
                                width: 388.w,
                                padding: EdgeInsets.only(top: 5.h,left: 8.w,right: 8,bottom: 8.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
                                      child: Image.asset(
                                        item.image,
                                        height: 164.h,
                                        width:388.23.w,
                                        fit: BoxFit.cover,

                                      ),
                                    ),

                                    SizedBox(height: 10.h),
                                    Padding(
                                      padding:  EdgeInsets.only(left: 15.w),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          Text(
                                            item.title,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14.31.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 10.h),
                                          Text(
                                            item.description,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Padding(
                                      padding:  EdgeInsets.only(left: 55.w),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (contex)=>StartTask()));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10))),
                                        child: Ink(
                                          decoration: BoxDecoration(
                                              gradient:
                                              const LinearGradient(colors: [Colors.blueAccent, Colors.greenAccent]),
                                              borderRadius: BorderRadius.circular(10)),
                                          child: Container(
                                            width: 274.w,
                                            height: 42.h,
                                            alignment: Alignment.center,
                                            child:  Text(
                                              'Start Task',
                                              style:
                                               TextStyle(fontSize: 16.sp, ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),


            Positioned(
              top: 90,
              left: 18,
              child: Container(
                width: 387.w,
                height: 100.h,
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
                      padding:  EdgeInsets.only(top: 10.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              Text("Social Media Reacts",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),
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
                          SizedBox(height: 5.h,),
                          Text("Complete Tasks to earn points",style: TextStyle(color: Colors.grey,fontSize: 12.sp)),
                        ],
                      ),
                    ),

                    leading: Padding(
                      padding:  EdgeInsets.only(left: 10.w,top: 10.h),
                      child: Column(
                        children:  [
                         Image.asset("assets/icons/social.png",height: 18.h,width: 20.w,),
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
