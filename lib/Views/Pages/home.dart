import 'package:bodoo_flutter/Providers/community_provider.dart';
import 'package:bodoo_flutter/Providers/home_provider.dart';
import 'package:bodoo_flutter/Providers/wallet_provider.dart';
import 'package:bodoo_flutter/Views/Pages/notifications_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_stack/image_stack.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import '../../Providers/auth_provider.dart';
import '../../Providers/level_provider.dart';
import '../../Providers/subscription_provider.dart';
import '../../Theme/palette.dart';
import '../../Utils/screen_config.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'SubscriptionPlan.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

   //int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60 * 24 * 10;
  List<String> images = ["https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1800&t=st=1678861722~exp=1678862322~hmac=64db2cad4d20ee07362021ab8c800a48daafd8ccaf741206c82d8c8a01566620", 'https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1800&t=st=1678861722~exp=1678862322~hmac=64db2cad4d20ee07362021ab8c800a48daafd8ccaf741206c82d8c8a01566620','https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1800&t=st=1678861722~exp=1678862322~hmac=64db2cad4d20ee07362021ab8c800a48daafd8ccaf741206c82d8c8a01566620',"https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1800&t=st=1678861722~exp=1678862322~hmac=64db2cad4d20ee07362021ab8c800a48daafd8ccaf741206c82d8c8a01566620", 'https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1800&t=st=1678861722~exp=1678862322~hmac=64db2cad4d20ee07362021ab8c800a48daafd8ccaf741206c82d8c8a01566620','https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1800&t=st=1678861722~exp=1678862322~hmac=64db2cad4d20ee07362021ab8c800a48daafd8ccaf741206c82d8c8a01566620'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60 * 24 * 10;
    Provider.of<HomeProvider>(context,listen: false).getHomeData();
    Provider.of<LevelProvider>(context,listen: false).getLevels();
    Provider.of<AuthProvider>(context,listen: false).userProfile(context);
    Provider.of<WalletProvider>(context,listen: false).getWallet();
    Provider.of<CommunityProvider>(context,listen: false).getUserCommunity(context);
    Provider.of<SubscriptionPlanProvider>(context,listen: false).getSubscriptionPlan(context);
  }

  @override
  Widget build(BuildContext context) {

    //ScreenConfig().init(context);
    ScreenUtil.init(context, designSize: const Size(428, 1150));
    return

      Scaffold(
      body: SizedBox(
        height: 1150.h,
        width: 428.w,
        child: Column(
          children: [
            Consumer<HomeProvider>(

              builder: (context, homeProvider,child) {
                return SizedBox(
                  height: 650.h,
                  width: 428.w,
                  child: Stack(
                    children: [
                      Column(
                        children: <Widget>[
                          Container(
                            height: 380.h,
                           // width: ScreenConfig.screenWidth,
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
                              padding:  EdgeInsets.only(top: 50.h,left: 20.w,right: 20.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Home', style: TextStyle(color: Colors.white,fontSize: 25.sp,fontWeight: FontWeight.bold),),
                                      Padding(
                                        padding:  EdgeInsets.only(left: 170),
                                        child: IconButton(onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionPlan()));
                                        }, icon:  Image.asset(
                                         "assets/icons/king.png",
                                        ),),
                                      ),

                                      IconButton(onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                                      }, icon:  SvgPicture.asset(
                                        'assets/icons/notification.svg',
                                        semanticsLabel: 'A red up arrow',
                                      ),)

                                    ],
                                  ),
                                  SizedBox(height: 10.h,),
                                  Container(
                                    height: 90.h,
                                    width: 90.w,
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
                                  SizedBox(height: 20.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(homeProvider.homeModel != null ? " ${  homeProvider.homeModel!.userLevel}" : '',style: TextStyle(color: Colors.white),),
                                      //Text("Level 2",style: TextStyle(color: Colors.white),),
                                    ],
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Stack(
                                      children: [
                                        LinearProgressIndicator(
                                          minHeight: 20.h,
                                          value: homeProvider.homeModel != null ? homeProvider.homeModel!.completedTasks/homeProvider.homeModel!.totalTasks : 0,
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
                        top: 340.h,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0,right: 20),
                          child: Container(
                            height: 300.h,
                           // width: ScreenConfig.screenWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: 8.w,top: 8.w,bottom: 8.h),
                                  child: Text('Tasks', style: TextStyle(color: Palette.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                ),

                                PieChart(
                                  dataMap: {
                                    "Watch Videos": homeProvider.homeModel != null ?  homeProvider.homeModel!.videos.toDouble() : 0.0,
                                    "Social Media":homeProvider.homeModel!=null ? homeProvider.homeModel!.completedSocialTask.toDouble() : 0.0,
                                    "Surveys": homeProvider.homeModel != null ?  homeProvider.homeModel!.surveys.toDouble() : 0.0,
                                    "Invite Friends": homeProvider.homeModel != null ?  homeProvider.homeModel!.invites.toDouble() : 0.0,
                                    "Others": homeProvider.homeModel != null ?  homeProvider.homeModel!.others.toDouble() : 0.0,
                                  },
                                  animationDuration: Duration(milliseconds: 800),
                                  chartLegendSpacing: 32,
                                  chartRadius: 190.h,
                                  colorList: [
                                    Palette.orange,
                                    Palette.lightGreen,
                                    Palette.darkGreen,
                                    Palette.ligtBlue,
                                    Palette.darkBlue,
                                  ],
                                  initialAngleInDegree: 0,
                                  chartType: ChartType.ring,
                                  ringStrokeWidth: 20,
                                  centerText: homeProvider.homeModel != null ? " ${  homeProvider.homeModel!.userLevel}" : '',
                                  legendOptions: LegendOptions(
                                    showLegendsInRow: false,
                                    legendPosition: LegendPosition.right,
                                    showLegends: true,
                                    legendShape: BoxShape.circle,
                                    legendTextStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
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
                      ),

                    ],
                  ),
                );
              }
            ),
            SizedBox(height: 10.h,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 20,right: 20,bottom: 20),
                      // child: Container(
                      //   height: 110,
                      //   width: 388,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     gradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 10,right: 10),
                      //     child: Row(
                      //        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Column(
                      //
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Text("14 days free Trial\n will end in:",style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.w600,
                      //             ),),
                      //           ],
                      //         ),
                      //         Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Row(
                      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Text("13",style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: 22,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),),
                      //                 Padding(
                      //                   padding:  EdgeInsets.only(left: 15),
                      //                   child: Text("12",style: TextStyle(
                      //                     color: Colors.white,
                      //                     fontSize: 22,
                      //                     fontWeight: FontWeight.bold,
                      //                   ),),
                      //                 ),
                      //                 Padding(
                      //                   padding: const EdgeInsets.only(left: 15),
                      //                   child: Text("45",style: TextStyle(
                      //                     color: Colors.white,
                      //                     fontSize: 22,
                      //                     fontWeight: FontWeight.bold,
                      //                   ),),
                      //                 ),
                      //                 Padding(
                      //                   padding: const EdgeInsets.only(left: 15),
                      //                   child: Text("36",style: TextStyle(
                      //                     color: Colors.white,
                      //                     fontSize: 22,
                      //                     fontWeight: FontWeight.bold,
                      //                   ),),
                      //                 ),
                      //               ],
                      //             ),
                      //             Padding(
                      //               padding: const EdgeInsets.only(left: 15),
                      //               child: Row(
                      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                 children: [
                      //                   Text("Day(s)",style: TextStyle(
                      //                     color: Colors.white,
                      //                     fontSize: 12,
                      //                     fontWeight: FontWeight.w600,
                      //                   ),),
                      //                   Padding(
                      //                     padding: const EdgeInsets.only(left: 5),
                      //                     child: Text("Hour",style: TextStyle(
                      //                       color: Colors.white,
                      //                       fontSize: 12,
                      //                       fontWeight: FontWeight.w600,
                      //                     ),),
                      //                   ),
                      //                   Padding(
                      //                     padding:  EdgeInsets.only(left: 5),
                      //                     child: Text("Minute",style: TextStyle(
                      //                       color: Colors.white,
                      //                       fontSize: 12,
                      //                       fontWeight: FontWeight.w600,
                      //                     ),),
                      //                   ),
                      //                   Padding(
                      //                     padding: const EdgeInsets.only(left: 5),
                      //                     child: Text("Second",style: TextStyle(
                      //                       color: Colors.white,
                      //                       fontSize: 12,
                      //                       fontWeight: FontWeight.w600,
                      //                     ),),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //
                      //       ],
                      //     ),
                      //   ),
                      // ),
                     child: Container(
                         height: 110,
                         width: 388,
                         decoration: BoxDecoration(
                           gradient: LinearGradient(
                             colors: [ Colors.blueAccent,Colors.greenAccent],
                             begin: Alignment.centerLeft,
                             end: Alignment.centerRight,
                           ),
                           borderRadius: BorderRadius.circular(10),
                         ),
                       child: Padding(
                         padding: const EdgeInsets.only(right: 10,left: 10),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(

                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text("Your free trial will\n end in:",style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 16.sp,
                                   fontWeight: FontWeight.w600,
                                 ),),
                                 SizedBox(height: 5,),
                                 Container(
                                   height: 34,
                                   width: 119,
                                   decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.circular(8),
                                   ),

                                   child: InkWell(
                                     onTap: (){
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionPlan()));

                                     },
                                     child: Center(
                                       child: Text(
                                         'Upgrade Plan',
                                         style: TextStyle(
                                           color: Colors.black,
                                           fontSize: 12.sp,
                                           fontWeight: FontWeight.w600,

                                         ),
                                       ),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                             Consumer<AuthProvider>(

                               builder: (context, snapshot,child) {
                                 return Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     // CountdownTimer(
                                     //    endTime:snapshot.user != null ? snapshot.user!.joinedDate.millisecondsSinceEpoch + 1000 * 60 * 60 * 24 * 10 : DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60 * 24 * 10,
                                     //   widgetBuilder: (_, CurrentRemainingTime? time) {
                                     //     if(time==null){
                                     //       return Text("time has ended");
                                     //     }
                                     //     return Row(
                                     //
                                     //       children: [
                                     //         Padding(
                                     //           padding: const EdgeInsets.only(right: 25),
                                     //           child: Text("${time.days ?? 0}",style: TextStyle(
                                     //             color: Colors.white,
                                     //             fontWeight: FontWeight.bold,
                                     //             fontSize: 22,
                                     //           ),),
                                     //         ),
                                     //         Padding(
                                     //           padding: const EdgeInsets.only(right: 25),
                                     //           child: Text("${time.hours ?? 0}",style:TextStyle(
                                     //             color: Colors.white,
                                     //             fontWeight: FontWeight.bold,
                                     //             fontSize: 22,
                                     //           ),),
                                     //         ),
                                     //         Padding(
                                     //           padding: const EdgeInsets.only(right: 15),
                                     //           child: Text("${time.min ?? 0}",style: TextStyle(
                                     //             color: Colors.white,
                                     //             fontWeight: FontWeight.bold,
                                     //             fontSize: 22,
                                     //           ),),
                                     //         ),
                                     //         Text("${time.sec ?? 0}",style: TextStyle(
                                     //           color: Colors.white,
                                     //           fontWeight: FontWeight.bold,
                                     //           fontSize: 22,
                                     //         ),),
                                     //       ],
                                     //     );
                                     //   },
                                     // ),

                                     CountdownTimer(
                                       endTime:snapshot.user != null ? snapshot.user!.joinedDate.millisecondsSinceEpoch + 1000 * 60 * 60 * 24 * 10 : DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60 * 24 * 10,
                                       widgetBuilder: (_, CurrentRemainingTime? time) {
                                         if (time == null) {

                                           Future.delayed(Duration.zero, () {
                                             // Navigator.pushReplacement(
                                             //   context,
                                             //   MaterialPageRoute(builder: (context) => SubscriptionPlan()),
                                             // );
                                           });
                                           return Container();
                                         }
                                         return Row(

                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only(right: 25),
                                               child: Text("${time.days ?? 0}",style: TextStyle(
                                                 color: Colors.white,
                                                 fontWeight: FontWeight.bold,
                                                 fontSize: 22.sp,
                                               ),),
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(right: 25),
                                               child: Text("${time.hours ?? 0}",style:TextStyle(
                                                 color: Colors.white,
                                                 fontWeight: FontWeight.bold,
                                                 fontSize: 22.sp,
                                               ),),
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(right: 15),
                                               child: Text("${time.min ?? 0}",style: TextStyle(
                                                 color: Colors.white,
                                                 fontWeight: FontWeight.bold,
                                                 fontSize: 22.sp,
                                               ),),
                                             ),
                                             Text("${time.sec ?? 0}",style: TextStyle(
                                               color: Colors.white,
                                               fontWeight: FontWeight.bold,
                                               fontSize: 22.sp,
                                             ),),
                                           ],
                                         );
                                       },
                                     ),
                                     Row(
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.only(right: 0),
                                           child: Text("day(s)",style: TextStyle(
                                             color: Colors.white,
                                             fontWeight: FontWeight.w600,
                                             fontSize:12.sp,
                                           ),),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 20,right: 10),
                                           child: Text("hour",style: TextStyle(
                                             color: Colors.white,
                                             fontWeight: FontWeight.w600,
                                             fontSize:12.sp,
                                           ),),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 10),
                                           child: Text("minute",style: TextStyle(
                                             color: Colors.white,
                                             fontWeight: FontWeight.w600,
                                             fontSize:12.sp,
                                           ),),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 10),
                                           child: Text("second",style: TextStyle(
                                             color: Colors.white,
                                             fontWeight: FontWeight.w600,
                                             fontSize:12.sp,
                                           ),),
                                         ),
                                       ],
                                     ),
                                   ],
                                 );
                               }
                             ),
                           ],
                         ),
                       ),
                     ),
                    ),
                    Consumer<WalletProvider>(

                      builder: (context, walletProvider,child) {

                        return Padding(
                          padding:  EdgeInsets.only(left: 20.w, right: 20.w),
                          child: Container(
                            height: 225.h,
                            width: ScreenConfig.screenWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Padding(
                                  padding:  EdgeInsets.only(left: 20.w,top: 13.h),
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
                                        ),
                                        SizedBox(width: 5.w,),
                                        Text(walletProvider.walletModel != null ? walletProvider.walletModel!.availablePoint.toString() : '0', style: TextStyle(color: Palette.black25,fontSize: 32.sp,fontWeight: FontWeight.bold),),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text('Today Earning', style: TextStyle(color: Palette.grey74,fontSize: 14.sp,),),
                                        Text(walletProvider.walletModel != null ? '${walletProvider.walletModel!.todayEarnings.toString()} EGP' : '0 EGP', style: TextStyle(color: Palette.black25,fontSize: 14.sp,fontWeight: FontWeight.bold),),

                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text('Total Earning', style: TextStyle(color: Palette.grey74,fontSize: 14.sp,),),
                                        Text(walletProvider.walletModel != null ? '${walletProvider.walletModel!.todayEarnings.toString()} EGP' : '0 EGP', style: TextStyle(color: Palette.black25,fontSize: 14.sp,fontWeight: FontWeight.bold),),

                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );

                      },
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h),
                      child: Container(
                        //width: ScreenConfig.screenWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Community', style: TextStyle(color: Palette.black,fontSize: 18,fontWeight: FontWeight.bold),),
                              Text('Following are the Part of your Community', style: TextStyle(color: Palette.grey74,fontSize: 14,),),

                              Consumer<CommunityProvider>(
                                builder: (context, communityProvider,child) {
                                  return ListView.builder(
                                    itemCount: communityProvider.communityList.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context,index){
                                        return Padding(
                                          padding: const EdgeInsets.only(top: 10.0),
                                          child: Row(
                                            children: <Widget>[
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: 60,
                                                    width: 60,
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
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 10,),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: <Widget>[
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text(communityProvider.communityList[index].name, style: TextStyle(color: Palette.black,fontSize: 16,fontWeight: FontWeight.bold),),
                                                          Text('Level 1 - Grade 1', style: TextStyle(color: Palette.grey74,fontSize: 14,),),
                                                        ],
                                                      ),
                                                      SizedBox(width: 20,),
                                                      ImageStack(
                                                        imageList: images,
                                                        totalCount: communityProvider.communityList[index].cReferralsList.length, // If larger than images.length, will show extra empty circle
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
                                        );
                                      }
                                  );
                                }
                              )

                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
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
