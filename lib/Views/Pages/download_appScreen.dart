import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'notifications_Screen.dart';

class Item {
  final String name;
  final String image;
  Item({required this.name, required this.image});
}
final List<Item> items = [
  Item(name: 'McDonalds', image: 'assets/images/macdonalds.png'),
  Item(name: 'Twitch', image: 'assets/images/twitch.png'),
  Item(name: 'IMDb', image: 'assets/images/imdb.png'),
  Item(name: 'Tedx', image: 'assets/images/tedx.png'),
  Item(name: 'IMDb', image: 'assets/images/imdb.png'),
  Item(name: 'Tedx', image: 'assets/images/tedx.png'),
  Item(name: 'McDonalds', image: 'assets/images/macdonalds.png'),
  Item(name: 'Twitch', image: 'assets/images/twitch.png'),
];

class Item2 {
  final String name;
  final String image;
  Item2({required this.name, required this.image});
}
final List<Item2> items2 = [
Item2(name: 'Tedx', image: 'assets/images/tedx.png'),
Item2(name: 'Twitch', image: 'assets/images/twitch.png'),
Item2(name: 'IMDb', image: 'assets/images/imdb.png'),
Item2(name: 'McDonalds', image: 'assets/images/macdonalds.png'),
];

class DownloadApp extends StatefulWidget {
  @override
  _DownloadAppState createState() => _DownloadAppState();
}




class _DownloadAppState extends State<DownloadApp> {
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
                    padding: EdgeInsets.only(left: 20.0.w,right: 20.0.w,top: 50.h),
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

                        Text("Download App",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),),
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
        top: 150,
        child: Container(
          height: 735.h,
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
                  padding:  EdgeInsets.only(top: 80.h,left: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Download App",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600),),
                      SizedBox(height: 5.h,),
                      Text("Earn points on downloading Apps",style: TextStyle(fontSize: 16.sp,color: Colors.grey),),
                    ],
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.only(top: 30.h,right: 10.w,left: 10.w),
                  child: Column(
                    children: [
                      GridView.count(
                        physics: BouncingScrollPhysics(),
                        mainAxisSpacing: 10,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        children: List.generate(items.length, (index) {
                          return Center(
                            child: Column(
                              children: [
                                Image.asset(
                                  items[index].image,
                                  height: 63.h,
                                  width: 63.w,
                                ),
                                SizedBox(height: 8.h),
                                Text(items[index].name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.sp),),
                              ],
                            ),
                          );
                        },
                        ),
                      ),

                    ],
                  ),
                ),
                 Padding(
                   padding:  EdgeInsets.only(left: 20.w,right: 10.w,top:10.h),
                   child: Container(
                     height: 130.h,
                     width: 388.w,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15.0),
                       gradient: LinearGradient(colors: [Colors.black,Colors.grey]),
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Padding(
                           padding:  EdgeInsets.only(top: 40.h),
                           child: Column(
                             children: [
                               Text("Uber",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 40.sp),),
                             ],
                           ),
                         ),
                         Padding(
                           padding:  EdgeInsets.only(top: 40.h),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("Download the App\n Earn Points",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize:18.sp ),),

                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
                    Padding(
                      padding:  EdgeInsets.only(top: 30.h,right: 10.w,left: 10.w),
                      child: Column(
                        children: [
                          GridView.count(
                            physics: BouncingScrollPhysics(),
                            mainAxisSpacing: 10,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            crossAxisCount: 4,
                            children: List.generate(items2.length, (index) {
                              return Center(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      items2[index].image,
                                      height: 63.h,
                                      width: 63.w,
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(items2[index].name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.sp),),
                                  ],
                                ),
                              );
                            },
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
                      padding:  EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text("Download App",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),
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
                        Image.asset("assets/icons/download.png",height: 24.h,width: 24.w,),
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







