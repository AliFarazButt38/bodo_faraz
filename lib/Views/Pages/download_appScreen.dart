import 'package:bodoo_flutter/Providers/download_apps_provider.dart';
import 'package:bodoo_flutter/Theme/palette.dart';
import 'package:bodoo_flutter/Views/Pages/app_detail.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<DownloadAppsProvider>(context,listen: false).getDownloadAppUrls();
  }

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
                    padding:  EdgeInsets.only(left: 10.0.w,right: 10.0.w),
                    child: Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: Row(
                        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                    },
                          child:ImageIcon(AssetImage("assets/icons/backward.png",),size: 30,color: Colors.white,),
                          ),

                          Text("Download App",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),),
                          InkWell
                            (
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                              },
                              child: ImageIcon(AssetImage('assets/icons/notification.png',),size: 25,color: Colors.white,)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),



      Positioned.fill(
        top: 150,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80,left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Download App",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      SizedBox(height: 5,),
                      Text("Earn points on downloading Apps",style: TextStyle(fontSize: 18,color: Colors.grey),),
                    ],
                  ),
                ),

                Consumer<DownloadAppsProvider>(

                  builder: (context, downloadAppProvider,child) {
                    if(downloadAppProvider.appsLoading){
                      return Center(child: CircularProgressIndicator(color: Palette.baseElementGreen,));
                    }else if(downloadAppProvider.appsList.isNotEmpty){
                      return Column(
                        children:[
                          Padding(
                            padding: const EdgeInsets.only(top: 30,right: 10,left: 10),
                            child: Column(
                              children: [
                                GridView.count(
                                  physics: BouncingScrollPhysics(),
                                  mainAxisSpacing: 20,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  crossAxisCount: 4,
                                  children: List.generate(downloadAppProvider.appsList.length, (index) {
                                    return InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => AppDetails(appModel: downloadAppProvider.appsList[index])));

                                       // _launchUrl(Uri.parse(downloadAppProvider.appsList[index].url));
                                      },
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Image.network(
                                              downloadAppProvider.appsList[index].image,
                                              height: 63,
                                              width: 63,
                                            ),
                                            SizedBox(height: 8),
                                            Text(downloadAppProvider.appsList[index].title,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top:20),
                            child: Container(
                              height: 130,
                              width: 388,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                gradient: LinearGradient(colors: [Colors.black,Colors.grey]),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Column(
                                      children: [
                                        Text("Uber",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 50),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Download the App",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize:18 ),),
                                        SizedBox(height: 10,),
                                        Text("Earn Points",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize:18 ),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 30,right: 10,left: 10),
                          //   child: Column(
                          //     children: [
                          //       GridView.count(
                          //         physics: BouncingScrollPhysics(),
                          //         mainAxisSpacing: 20,
                          //         scrollDirection: Axis.vertical,
                          //         shrinkWrap: true,
                          //         crossAxisCount: 4,
                          //         children: List.generate(items2.length, (index) {
                          //           return Center(
                          //             child: Column(
                          //               children: [
                          //                 Image.asset(
                          //                   items2[index].image,
                          //                   height: 63,
                          //                   width: 63,
                          //                 ),
                          //                 SizedBox(height: 8),
                          //                 Text(items2[index].name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),),
                          //               ],
                          //             ),
                          //           );
                          //         },
                          //         ),
                          //       ),
                          //
                          //     ],
                          //   ),
                          // ),


                        ],
                      );
                    }else{
                      return Center(child: Text('No Apps'));
                    }

                  }
                ),

                  ],
            ),
          ),
        ),
      ),
            Positioned(
              top: 100,
              left: 13,
              child: Container(
                width: 370,
                height: 90,
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
                      padding: const EdgeInsets.only(bottom: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Download App",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                          Text("41/60",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
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
                      padding: const EdgeInsets.only(left: 8.0,top: 18.0),
                      child: Column(
                        children: const [
                          ImageIcon(AssetImage('assets/icons/download.png',),size: 24,color: Colors.black,),
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







