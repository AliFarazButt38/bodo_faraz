import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'notifications_Screen.dart';

class ContainerData {
  final String image;
  final String text;
  final String description;

  ContainerData({required this.image, required this.text,required this.description});
}

List<ContainerData> containerDataList = [
  ContainerData(
   image:'assets/images/TwitchReview.png',
    text: 'App Name',
    description: 'Lorem Ipsum is simply dummy text of the ',

  ),
  ContainerData(
    image: 'assets/images/TedxReview.png',
    text: 'App Name',
    description: 'Lorem Ipsum is simply dummy text of the ',
  ),
  ContainerData(
    image: 'assets/images/McdonaldsReview.png',
    text: 'App Name',
    description: 'Lorem Ipsum is simply dummy text of the ',
  ),
  ContainerData(
    image: 'assets/images/ImdbReview.png',
    text: 'App Name',
    description: 'Lorem Ipsum is simply dummy text of the ',
  ),
];

class WriteReview extends StatefulWidget {
  const WriteReview({Key? key}) : super(key: key);

  @override
  State<WriteReview> createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
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
                    padding:  EdgeInsets.only(left: 20.0.w,right: 20.0.w,top: 50.h),
                    child: Row(
                      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [

                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child:Image.asset("assets/icons/backward.png",height: 30.h,width: 30.w,),                          ),


                        Text("Review",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),),
                        InkWell
                          (
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                            },
                            child:  Padding(
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
        child: SingleChildScrollView(
          child: Container(
            height: 757.h,
            width: 428.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
              color: Colors.white,
            ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 80.h,left: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Write a review",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.sp),),
                        SizedBox(height: 5.h,),
                        Text("Earn points on giving review",style: TextStyle(fontSize: 16.sp,color: Colors.grey),),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: containerDataList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.all(10),
                              height: 100.h,
                              width: 388.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      containerDataList[index].image,
                                      height: 80.h,
                                      width: 80.w,
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 10.w,top: 10.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          containerDataList[index].text,
                                          style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 5.h,),
                                          Text(
                                            containerDataList[index].description,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 12.sp,),

                                          ),

                                        SizedBox(height: 5.h,),
                                        Row(
                                          children: [
                                            Image.asset("assets/icons/star.png",width: 16.w,height: 16.h,),
                                            Padding(
                                              padding:  EdgeInsets.only(left: 5.w,top: 5.h),
                                              child: Text("Give Review to earn Points",style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.sp,
                                              ),),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
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
                      padding:  EdgeInsets.only(bottom: 13.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text("Write a Review",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                          Text("41/60",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),
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
                      padding:  EdgeInsets.only(left: 8.0.w,top: 18.0.h),
                      child: Column(
                        children:  [
                          Image.asset("assets/icons/review.png",width: 21.w,height: 21.h,),
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
