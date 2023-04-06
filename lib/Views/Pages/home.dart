import 'package:bodoo_flutter/Providers/community_provider.dart';
import 'package:bodoo_flutter/Providers/home_provider.dart';
import 'package:bodoo_flutter/Providers/wallet_provider.dart';
import 'package:bodoo_flutter/Views/Pages/notifications_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_stack/image_stack.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import '../../Providers/auth_provider.dart';
import '../../Providers/level_provider.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeProvider>(context,listen: false).getHomeData();
    Provider.of<LevelProvider>(context,listen: false).getLevels();
    Provider.of<AuthProvider>(context,listen: false).userProfile(context);
    Provider.of<WalletProvider>(context,listen: false).getWallet();
  }

  @override
  Widget build(BuildContext context) {

    //ScreenConfig().init(context);
    ScreenUtil.init(context, designSize: const Size(428, 1150));
    return Scaffold(
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
                                      Text(homeProvider.homeModel != null ? "Level ${  homeProvider.homeModel!.userLevel}" : '',style: TextStyle(color: Colors.white),),
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
                                    "Social Media": 0,
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
                                  centerText: homeProvider.homeModel != null ? "Level ${  homeProvider.homeModel!.userLevel}" : '',
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
                      )
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
                                        Text('Today Erning', style: TextStyle(color: Palette.grey74,fontSize: 14.sp,),),
                                        Text(walletProvider.walletModel != null ? '${walletProvider.walletModel!.todayEarnings.toString()} EGP' : '0 EGP', style: TextStyle(color: Palette.black25,fontSize: 14.sp,fontWeight: FontWeight.bold),),

                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text('Total Erning', style: TextStyle(color: Palette.grey74,fontSize: 14.sp,),),
                                        Text(walletProvider.walletModel != null ? '${walletProvider.walletModel!.todayEarnings.toString()} EGP' : '0 EGP', style: TextStyle(color: Palette.black25,fontSize: 14.sp,fontWeight: FontWeight.bold),),

                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }
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
