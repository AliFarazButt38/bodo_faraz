import 'package:bodoo_flutter/Views/Pages/notifications_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_stack/image_stack.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../Theme/palette.dart';
import '../../Utils/screen_config.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> images = ["https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1800&t=st=1678861722~exp=1678862322~hmac=64db2cad4d20ee07362021ab8c800a48daafd8ccaf741206c82d8c8a01566620", 'https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1800&t=st=1678861722~exp=1678862322~hmac=64db2cad4d20ee07362021ab8c800a48daafd8ccaf741206c82d8c8a01566620','https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1800&t=st=1678861722~exp=1678862322~hmac=64db2cad4d20ee07362021ab8c800a48daafd8ccaf741206c82d8c8a01566620',"https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1800&t=st=1678861722~exp=1678862322~hmac=64db2cad4d20ee07362021ab8c800a48daafd8ccaf741206c82d8c8a01566620", 'https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1800&t=st=1678861722~exp=1678862322~hmac=64db2cad4d20ee07362021ab8c800a48daafd8ccaf741206c82d8c8a01566620','https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1800&t=st=1678861722~exp=1678862322~hmac=64db2cad4d20ee07362021ab8c800a48daafd8ccaf741206c82d8c8a01566620'];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    ScreenConfig().init(context);
    return Scaffold(
      body: SizedBox(
        height:926.h,
        width: 428.w,
        child: Column(
          children: [
            SizedBox(
              height: 500,
              width: ScreenConfig.screenWidth,
              child: Stack(
                children: [
                  Column(
                    children: <Widget>[
                      Container(
                        height: 400.h,
                        width: 428.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(14),
                            bottomLeft: Radius.circular(14)
                          ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Palette.baseElementBlue,
                                Palette.baseElementGreen,
                              ],
                            )
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 50.0.h,left: 20.w,right: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Home', style: TextStyle(color: Colors.white,fontSize: 25.sp,fontWeight: FontWeight.bold),),

                                  IconButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                                  }, icon:  SvgPicture.asset(
                                    'assets/icons/notification.svg',
                                    semanticsLabel: 'A red up arrow',
                                    height: 20.h,
                                    width: 19.w,
                                  ),)

                                ],
                              ),
                              SizedBox(height: 10.h,),
                              Container(
                                height: 74.h,
                                width: 74.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white),
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/profile.png'),
                                    fit: BoxFit.fill,
                                    filterQuality: FilterQuality.high
                                  )
                                ),
                              ),
                              SizedBox(height: 40.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Level 1",style: TextStyle(color: Colors.white,fontSize: 14.sp),),
                                  Text("Level 2",style: TextStyle(color: Colors.white,fontSize: 14.sp),),
                                ],
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Stack(
                                  children: [
                                    LinearProgressIndicator(
                                      minHeight: 20.0,
                                      value: 0.5,
                                      color: Colors.greenAccent,
                                      backgroundColor: Colors.white,
                                    ),
                                    // Positioned(
                                    //   left: 100,
                                    //   top: 0,
                                    //   bottom: 0,
                                    //   child: Container(
                                    //     width: 3,
                                    //     color: Colors.white,
                                    //   ),
                                    // ),
                                    // Positioned(
                                    //   right: 100,
                                    //   top: 0,
                                    //   bottom: 0,
                                    //   child: Container(
                                    //     width: 3,
                                    //     color: Colors.black,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     Text("Gradle 1",style: TextStyle(color: Colors.white),),
                              //     Text("Gradle 2",style: TextStyle(color: Colors.white),),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    top: 300,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0.w,right: 20.w),
                      child: Container(
                        height: 236.h,
                        width: 388.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Tasks', style: TextStyle(color: Palette.black,fontSize: 18.sp,fontWeight: FontWeight.bold),),
                            ),

                            PieChart(
                              dataMap: {
                                "Watch Videos": 5,
                                "Social Media": 3,
                                "Surveys": 2,
                                "Invite Friends": 2,
                                "Others": 2,
                              },
                              animationDuration: Duration(milliseconds: 800),
                              chartLegendSpacing: 32,
                              chartRadius: 98.57,
                              colorList: [
                                Palette.orange,
                                Palette.lightGreen,
                                Palette.darkGreen,
                                Palette.ligtBlue,
                                Palette.darkBlue,
                              ],
                              initialAngleInDegree: 0,
                              chartType: ChartType.ring,
                              ringStrokeWidth: 15,
                              centerText: "145 \n level 2",
                              legendOptions: LegendOptions(
                                showLegendsInRow: false,
                                legendPosition: LegendPosition.right,
                                showLegends: true,
                                legendShape: BoxShape.circle,
                                legendTextStyle: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                              chartValuesOptions: ChartValuesOptions(
                                showChartValueBackground: true,
                                showChartValues: false,
                                showChartValuesInPercentage: false,
                                showChartValuesOutside: false,
                                decimalPlaces: 1,
                              ),
                              // gradientList: ---To add gradient colors---
                              // emptyColorGradient: ---Empty Color gradient---
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 20.0.w, right: 20.w),
                      child: Container(
                        height: 219.h,
                        width: 388.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding:  EdgeInsets.only(left: 20.0.w,top: 13.h),
                              child: Text('Balance', style: TextStyle(color: Palette.black,fontSize: 18.sp,fontWeight: FontWeight.bold),),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Available Points', style: TextStyle(color: Palette.grey74,fontSize: 16.sp,),),
                                SizedBox(height: 5.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: <Widget>[
                                    SvgPicture.asset(
                                      'assets/icons/star.svg',
                                      semanticsLabel: 'A red up arrow',
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                    SizedBox(width: 5.h,),
                                    Text('50,000', style: TextStyle(color: Palette.black25,fontSize: 32.sp,fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text('Today Erning', style: TextStyle(color: Palette.grey74,fontSize: 14.sp,),),
                                    Text('50,000 EGP', style: TextStyle(color: Palette.black25,fontSize: 14.sp,fontWeight: FontWeight.bold),),

                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text('Today Erning', style: TextStyle(color: Palette.grey74,fontSize: 14.sp,),),
                                    Text('50,000 EGP', style: TextStyle(color: Palette.black25,fontSize: 14.sp,fontWeight: FontWeight.bold),),

                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
                      child: Container(
                        width: 388.w,
                        height: 433.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Community', style: TextStyle(color: Palette.black,fontSize: 18.sp,fontWeight: FontWeight.bold),),
                              Text('Following are the Part of your Community', style: TextStyle(color: Palette.grey74,fontSize: 14.sp,),),
                              Padding(
                                padding:  EdgeInsets.only(top: 20.0.h),
                                child: Row(
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
                                            height: 20.h,
                                            width: 20.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10.w,),
                                    Column(
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
                                            SizedBox(width: 20.w,),
                                            ImageStack(
                                              imageList: images,
                                              totalCount: images.length, // If larger than images.length, will show extra empty circle
                                              imageRadius: 32, // Radius of each images
                                              imageCount: 3, // Maximum number of images to be shown in stack
                                              imageBorderWidth: 3, // Border width around the images
                                            )
                                          ],
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top: 20.0.h),
                                child: Row(
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
                                            height: 20.h,
                                            width: 20.w,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10.w,),
                                    Column(
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
                                            SizedBox(width: 20.w,),
                                            ImageStack(
                                              imageList: images,
                                              totalCount: images.length, // If larger than images.length, will show extra empty circle
                                              imageRadius: 32, // Radius of each images
                                              imageCount: 3, // Maximum number of images to be shown in stack
                                              imageBorderWidth: 3, // Border width around the images
                                            )
                                          ],
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
