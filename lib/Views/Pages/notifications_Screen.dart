
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerData {
  final String image;
  final String text;
  final String time;
  final String refrel;

  ContainerData({required this.image, required this.text,required this.time,required this.refrel});
}

List<ContainerData> containerDataList = [
  ContainerData(
    image:'assets/icons/profile.png',
    text: 'Ainal Aimaz',
    refrel: "used your refrrel",
    time: "2h ago",
  ),
  ContainerData(
    image: 'assets/icons/splash.png',
    text: 'Your invite',
    refrel: "has been send",
    time: "2h ago",
  ),
  ContainerData(
    image:'assets/icons/profile.png',
    text: 'Ainal Aimaz',
    refrel: "used your refrrel",
    time: "2h ago",
  ),
  ContainerData(
    image:'assets/icons/profile.png',
    text: 'Ainal Aimaz',
    refrel: "used your refrrel",
    time: "2h ago",
  ),
  ContainerData(
    image:'assets/icons/profile.png',
    text: 'Ainal Aimaz',
    refrel: "used your refrrel",
    time: "2h ago",
  ),
];
class ContainerData2{
  final String image;
  final String text;
  final String time;
  final String refrel;

  ContainerData2({required this.image, required this.text,required this.time,required this.refrel});
}


List<ContainerData> containerDataList2 = [
ContainerData(
image:'assets/icons/profile.png',
text: 'Ainal Aimaz',
refrel: "used your refrrel",
time: "3 March,2023 at 3:44 PM",
),
];

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
                        InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                    child:Image.asset("assets/icons/backward.png",height: 30.h,width: 30.w,),
                        ),

                        Text("Notifications",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),),
                        Padding(
                          padding:  EdgeInsets.only(top: 6.h),
                          child: Image.asset('assets/icons/settings.png',height: 21.h,width: 19.25.w,),
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
                height: 790.h,
                width: 428.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),topRight: Radius.circular(20.0),
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 20.w,top: 30.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Today",style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10.h,),
                              Row(
                                children: [
                                  Text("You have",style: TextStyle(color: Colors.black,fontSize: 16.sp),),
                                  Padding(
                                    padding:  EdgeInsets.only(right: 5.0.w,left: 5.0.w),
                                    child: Text("3 Notifications",style: TextStyle(color: Colors.blueAccent,fontSize: 16.sp),),
                                  ),
                                  Text("today",style: TextStyle(color: Colors.black,fontSize: 16.sp),),
                                ],
                              ),
                            ],
                          ),

                        ),
                        SizedBox(height: 30.h,),

                        Padding(
                          padding:  EdgeInsets.only(left: 10.w),
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: containerDataList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 100.h,
                                width: 90.w,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            containerDataList[index].image,
                                            height: 56.h,
                                            width: 56.w,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.w,top: 10.w),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(

                                                    containerDataList[index].text,
                                                    style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),

                                                  Padding(
                                                    padding:  EdgeInsets.only(left: 5.w),
                                                    child: Text(

                                                      containerDataList[index].refrel,style: TextStyle(fontSize: 16.sp),
                                                    maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10.h,),
                                              Text(
                                                containerDataList[index].time,
                                                style: TextStyle(color: Colors.grey,fontSize: 12.sp)),

                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(left: 20.w,right: 20.w),
                                      child: Divider(thickness: 1,height: 1.h,),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),

                        SizedBox(height: 10.h,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: 20.w),
                              child: Text("Yesterday",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: 10.w),
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: containerDataList2.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 100.h,
                                    width: 90.w,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            containerDataList2[index].image,
                                            height: 56.h,
                                            width: 56.w,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.w,top: 10.h),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    containerDataList2[index].text,
                                                    style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),
                                                  ),

                                                  Padding(
                                                    padding:  EdgeInsets.only(left: 5.w),
                                                    child: Text(containerDataList2[index].refrel,style: TextStyle(fontSize: 16.sp),),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10.h,),
                                              Text(
                                                containerDataList2[index].time,
                                                style: TextStyle(color: Colors.grey,fontSize: 12.sp),
                                              ),

                                            ],
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