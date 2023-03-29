
import 'package:bodoo_flutter/Views/Pages/write_Areview.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'download_appScreen.dart';
import 'notifications_Screen.dart';

class OthersTask extends StatefulWidget {
  const OthersTask({Key? key}) : super(key: key);

  @override
  State<OthersTask> createState() => _OthersTaskState();
}

class _OthersTaskState extends State<OthersTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 500,
                    width:MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      // color: Colors.blueAccent,
                      gradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Row(
                          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child:
                            Icon(Icons.arrow_back_ios,color: Colors.white,size: 25),

                            ),
                            Text("Others",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                            InkWell
                              (
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                                },
                                child: ImageIcon(AssetImage('assets/icons/notification.png',),size: 30,color: Colors.white,)),

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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),topRight:Radius.circular(20.0)),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25,top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:const [
                    Text("Others Tasks",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 22),),
                    SizedBox(height: 5),
                    Text("Complete the following number of tasks",style: TextStyle(color:Colors.grey,fontSize: 18),),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Column(
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
                              children: const [
                                Text("Download App",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                                Text("41/60"),
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
                                ImageIcon(AssetImage('assets/icons/download.png',),size: 30,color: Colors.black,),
                              ],
                            ),
                          ),

                          trailing: Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 18.0),
                            child: Column(
                              children: const [
                                ImageIcon(AssetImage('assets/icons/next.png',),size: 22,color: Colors.black,),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DownloadApp()));
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
                              children: const [
                                Text("Write a Review",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                                Text("41/60"),
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
                                ImageIcon(AssetImage('assets/icons/review.png',),size: 25,color: Colors.black,),
                              ],
                            ),
                          ),

                          trailing: Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 18.0),
                            child: Column(
                              children: const [
                                ImageIcon(AssetImage('assets/icons/next.png',),size: 22,color: Colors.black,),
                              ],
                            ),
                          ),
                          onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>WriteReview()));
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
                              children: const [
                                Text("Variable",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                                Text("41/60"),
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
                              children:  [
                                ImageIcon(AssetImage('assets/icons/survey.png',),size: 25,color: Colors.black,),
                              ],
                            ),
                          ),

                          trailing: Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 18.0),
                            child: Column(
                              children: const [
                                ImageIcon(AssetImage('assets/icons/next.png',),size: 22,color: Colors.black,),
                              ],
                            ),
                          ),
                          onTap: () {
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
