import 'package:bodoo_flutter/Providers/level_provider.dart';
import 'package:bodoo_flutter/Providers/wallet_provider.dart';
import 'package:bodoo_flutter/Views/Pages/socialmediatask_options.dart';
import 'package:bodoo_flutter/Views/Pages/surveys_screen.dart';
import 'package:bodoo_flutter/Views/Pages/watch_videoScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../Widgets/line_chart.dart';
import 'invite_friendsScreen.dart';
import 'notifications_Screen.dart';
import 'others_taskScreen.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _Wallet();
}

class _Wallet extends State<Wallet> {
  int _selectedIndex = 0;
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<WalletProvider>(context,listen: false).getPostpondReward();
    Provider.of<WalletProvider>(context,listen: false).getGraphValues();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    // color: Colors.blueAccent,
                    gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.greenAccent]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Wallet",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Notifications()));
                              },
                              child: ImageIcon(
                                AssetImage(
                                  'assets/icons/notification.png',
                                ),
                                size: 25,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned.fill(
              top: 120,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Consumer<WalletProvider>(

                          builder: (context, walletProvider,child) {
                            return Center(
                              child: Container(
                                width: 350,
                                 height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    top: BorderSide(color: Colors.grey, width: 1.0),
                                    bottom:
                                        BorderSide(color: Colors.grey, width: 1.0),
                                    left:
                                        BorderSide(color: Colors.grey, width: 1.0),
                                    right:
                                        BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Text(
                                      "Available Points",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: ImageIcon(
                                            AssetImage(
                                                "assets/icons/staryellow.png"),
                                            size: 25,
                                            color: Colors.yellowAccent,
                                          ),
                                        ),
                                        Text(
                                          walletProvider.walletModel != null ? walletProvider.walletModel!.availablePoint.toString() : '0',
                                          style: TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Todays Earning",
                                              style: TextStyle(
                                                  color: Colors.grey, fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  walletProvider.walletModel != null ? '${walletProvider.walletModel!.todayEarnings.toString()} EGP' : '0 EGP',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18),
                                                ),

                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Total Earning",
                                              style: TextStyle(
                                                  color: Colors.grey, fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  walletProvider.walletModel != null ? '${walletProvider.walletModel!.todayEarnings.toString()} EGP' : '0 EGP',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18),
                                                ),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: days.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  LineChartWidget();
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        days[index],
                                        style: TextStyle(
                                          color: _selectedIndex == index
                                              ? Colors.greenAccent
                                              : Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 2,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: _selectedIndex == index
                                              ? Colors.greenAccent
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        SizedBox(height: 10,),

                        Container(
                          height: 200,
                          width:370,
                          child: LineChartWidget(),
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Postponed Reward",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Reward from your network",
                                    style:
                                        TextStyle(fontSize: 18, color: Colors.grey),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Center(
                          child: Container(
                            width: 350,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(color: Colors.grey, width: 1.0),
                                bottom: BorderSide(color: Colors.grey, width: 1.0),
                                left: BorderSide(color: Colors.grey, width: 1.0),
                                right: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Consumer<WalletProvider>(

                              builder: (context, walletProvider,child) {
                                return Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Text("Points From Network",style: TextStyle(color: Colors.grey,fontSize: 16),),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: ImageIcon(AssetImage("assets/icons/staryellow.png"),size: 25,color: Colors.yellowAccent,),
                                        ),

                                        Text(walletProvider.referralModel != null ? '${walletProvider.referralModel!.totalEarning}' : '0',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    SizedBox(height: 30,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Text("Postponed Reward",style: TextStyle(color: Colors.grey,fontSize:14 ),),
                                            SizedBox(height: 15,),
                                            Row(
                                              children: [
                                                Text(walletProvider.referralModel != null ? '${walletProvider.referralModel!.todayEarning}' : '0',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5),
                                                  child: Text("EGP",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20,),
                                        Column(
                                          children: [
                                            Text("Network Members",style: TextStyle(color: Colors.grey,fontSize:14 ),),
                                            SizedBox(height: 15,),
                                            Text(walletProvider.referralModel != null ? '${walletProvider.referralModel!.accounts}' : '0',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 20),
                          child: Text("Task Detail",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Statement of your each task",style: TextStyle(fontSize: 18, color:Colors.grey),),
                        ),
                        SizedBox(height: 10),





                        Consumer<LevelProvider>(

                          builder: (context, levelProvider, child) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 390,
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
                                            children:  [
                                              Text("Watch Videos",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                                              Text("${levelProvider.completedVideos}/${levelProvider.totalVideos}"),
                                            ],
                                          ),
                                        ),
                                        subtitle: LinearPercentIndicator(
                                          barRadius: Radius.circular(15.0),
                                          animation: true,
                                          lineHeight: 12,
                                          percent: levelProvider.totalVideos == 0 ?  levelProvider.completedVideos/1 : levelProvider.completedVideos/levelProvider.totalVideos,

                                          // progressColor: Colors.blueAccent,
                                          linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                                          backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,

                                        ),
                                        leading: Padding(
                                          padding: const EdgeInsets.only(left: 10.0,top: 18.0),
                                          child: Column(
                                            children: const [
                                              ImageIcon(AssetImage('assets/icons/video.png',),size: 25,color: Colors.black,),
                                            ],
                                          ),
                                        ),

                                        trailing: Padding(
                                          padding: const EdgeInsets.only(left: 10.0,top: 18.0),
                                          child: Column(
                                            children: const [
                                              ImageIcon(AssetImage('assets/icons/next.png',),size: 22,color: Colors.black,),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>WatchVideo()));
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    width: 390,
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
                                            children:  [
                                              Text("Social Media Reacts",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                                              Text("${levelProvider.completedSocialTask}/${levelProvider.totalSocialTask}"),
                                            ],
                                          ),
                                        ),
                                        subtitle: LinearPercentIndicator(
                                          barRadius: Radius.circular(15.0),
                                          animation: true,
                                          lineHeight: 12,
                                          percent: levelProvider.totalSocialTask == 0 ?  levelProvider.completedSocialTask/1 : levelProvider.completedSocialTask/levelProvider.totalSocialTask,
                                          // progressColor: Colors.blueAccent,
                                          linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                                          backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,


                                        ),
                                        leading: Padding(
                                          padding: const EdgeInsets.only(left: 10.0,top: 18.0),
                                          child: Column(
                                            children: const [
                                              ImageIcon(AssetImage('assets/icons/social.png',),size: 25,color: Colors.black,),
                                            ],
                                          ),
                                        ),

                                        trailing: Padding(
                                          padding: const EdgeInsets.only(left: 10.0,top: 18.0),
                                          child: Column(
                                            children: const [
                                              ImageIcon(AssetImage('assets/icons/next.png',),size: 22,color: Colors.black,),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SocialMediaOptions()));
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    width: 390,
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
                                            children:  [
                                              Text("Surveys",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                                              Text("${levelProvider.completedForms}/${levelProvider.totalForms}"),
                                            ],
                                          ),
                                        ),
                                        subtitle: LinearPercentIndicator(
                                          barRadius: Radius.circular(15.0),
                                          animation: true,
                                          lineHeight: 12,
                                          percent: levelProvider.totalForms == 0 ?  levelProvider.completedForms/1 : levelProvider.completedForms/levelProvider.totalForms,

                                          // progressColor: Colors.blueAccent,
                                          linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                                          backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,

                                        ),
                                        leading: Padding(
                                          padding: const EdgeInsets.only(left: 10.0,top: 18.0),
                                          child: Column(
                                            children: const [
                                              ImageIcon(AssetImage('assets/icons/survey.png',),size: 25,color: Colors.black,),
                                            ],
                                          ),
                                        ),

                                        trailing: Padding(
                                          padding: const EdgeInsets.only(left: 10.0,top: 18.0),
                                          child: Column(
                                            children: const [
                                              ImageIcon(AssetImage('assets/icons/next.png',),size: 22,color: Colors.black,),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Surveys()));
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    width: 390,
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
                                            children:  [
                                              Text("Invite Friends",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                                              Text("${levelProvider.invites}/${levelProvider.maxInvites}"),
                                            ],
                                          ),
                                        ),
                                        subtitle: LinearPercentIndicator(
                                          barRadius: Radius.circular(15.0),
                                          animation: true,
                                          lineHeight: 12,
                                          percent: levelProvider.maxInvites == 0 ?  levelProvider.invites/1 : levelProvider.invites/levelProvider.maxInvites,

                                          // progressColor: Colors.blueAccent,
                                          linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                                          backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,

                                        ),
                                        leading: Padding(
                                          padding: const EdgeInsets.only(left: 10.0,top: 18.0),
                                          child: Column(
                                            children: const [
                                              ImageIcon(AssetImage('assets/icons/invite.png',),size: 25,color: Colors.black,),
                                            ],
                                          ),
                                        ),

                                        trailing: Padding(
                                          padding: const EdgeInsets.only(left: 10.0,top: 18.0),
                                          child: Column(
                                            children: const [
                                              ImageIcon(AssetImage('assets/icons/next.png',),size: 22,color: Colors.black,),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>InviteFriends()));
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    width: 390,
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
                                            children:  [
                                              Text("Others",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                                              Text("${levelProvider.completedOther}/${levelProvider.totalOther}"),
                                            ],
                                          ),
                                        ),
                                        subtitle: LinearPercentIndicator(
                                          barRadius: Radius.circular(15.0),
                                          animation: true,
                                          lineHeight: 12,
                                          percent: levelProvider.totalOther == 0 ?  levelProvider.completedOther/1 : levelProvider.completedOther/levelProvider.totalOther,

                                          // progressColor: Colors.blueAccent,
                                          linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                                          backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,
                                        ),
                                        leading: Padding(
                                          padding: const EdgeInsets.only(left: 10.0,top: 18.0),
                                          child: Column(
                                            children: const [
                                              ImageIcon(AssetImage('assets/icons/others.png',),size: 25,color: Colors.black,),
                                            ],
                                          ),
                                        ),

                                        trailing: Padding(
                                          padding: const EdgeInsets.only(left: 10.0,top: 18.0),
                                          child: Column(
                                            children: const [
                                              ImageIcon(AssetImage('assets/icons/next.png',),size: 22,color: Colors.black,),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OthersTask()));
                                        },
                                      ),
                                    ),
                                  ),
                                ],

                              ),

                            );
                          }
                        ),

                      ],
                    ),
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
