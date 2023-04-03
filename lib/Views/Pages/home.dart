import 'package:bodoo_flutter/Providers/home_provider.dart';
import 'package:bodoo_flutter/Providers/wallet_provider.dart';
import 'package:bodoo_flutter/Views/Pages/notifications_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_stack/image_stack.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
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

    ScreenConfig().init(context);
    return Scaffold(
      body: SizedBox(
        height: ScreenConfig.screenHeight,
        width: ScreenConfig.screenWidth,
        child: Column(
          children: [
            Consumer<HomeProvider>(

              builder: (context, homeProvider,child) {
                return SizedBox(
                  height: 500,
                  width: ScreenConfig.screenWidth,
                  child: Stack(
                    children: [
                      Column(
                        children: <Widget>[
                          Container(
                            height: 347,
                            width: ScreenConfig.screenWidth,
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
                              padding: const EdgeInsets.only(top: 50.0,left: 20,right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Home', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),

                                      IconButton(onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                                      }, icon:  SvgPicture.asset(
                                        'assets/icons/notification.svg',
                                        semanticsLabel: 'A red up arrow',
                                      ),)

                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    height: 74,
                                    width: 74,
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
                                  SizedBox(height: 40,),
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
                                          minHeight: 20.0,
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
                        top: 300,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0,right: 20),
                          child: Container(
                            height: 200,
                            width: ScreenConfig.screenWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                  chartRadius: MediaQuery.of(context).size.width / 3.2,
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
            SizedBox(height: 10,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Consumer<WalletProvider>(

                      builder: (context, walletProvider,child) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Container(
                            height: 219,
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
                                  padding: const EdgeInsets.only(left: 20.0,top: 13),
                                  child: Text('Balance', style: TextStyle(color: Palette.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Available Points', style: TextStyle(color: Palette.grey74,fontSize: 16,),),
                                    SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,

                                      children: <Widget>[
                                        SvgPicture.asset(
                                          'assets/icons/star.svg',
                                          semanticsLabel: 'A red up arrow',
                                        ),
                                        SizedBox(width: 5,),
                                        Text(walletProvider.walletModel != null ? walletProvider.walletModel!.availablePoint.toString() : '0', style: TextStyle(color: Palette.black25,fontSize: 32,fontWeight: FontWeight.bold),),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text('Today Erning', style: TextStyle(color: Palette.grey74,fontSize: 14,),),
                                        Text(walletProvider.walletModel != null ? '${walletProvider.walletModel!.todayEarnings.toString()} EGP' : '0 EGP', style: TextStyle(color: Palette.black25,fontSize: 14,fontWeight: FontWeight.bold),),

                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text('Total Erning', style: TextStyle(color: Palette.grey74,fontSize: 14,),),
                                        Text(walletProvider.walletModel != null ? '${walletProvider.walletModel!.todayEarnings.toString()} EGP' : '0 EGP', style: TextStyle(color: Palette.black25,fontSize: 14,fontWeight: FontWeight.bold),),

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
                      padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
                      child: Container(
                        width: ScreenConfig.screenWidth,
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
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
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
                                                Text('John Doe', style: TextStyle(color: Palette.black,fontSize: 16,fontWeight: FontWeight.bold),),
                                                Text('Level 1 - Grade 1', style: TextStyle(color: Palette.grey74,fontSize: 14,),),
                                              ],
                                            ),
                                            SizedBox(width: 20,),
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
                                padding: const EdgeInsets.only(top: 20.0),
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
                                                Text('John Doe', style: TextStyle(color: Palette.black,fontSize: 16,fontWeight: FontWeight.bold),),
                                                Text('Level 1 - Grade 1', style: TextStyle(color: Palette.grey74,fontSize: 14,),),
                                              ],
                                            ),
                                            SizedBox(width: 20,),
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
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
