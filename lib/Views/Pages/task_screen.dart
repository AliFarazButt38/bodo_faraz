
import 'package:bodoo_flutter/Providers/level_provider.dart';
import 'package:bodoo_flutter/Providers/survey_provider.dart';
import 'package:bodoo_flutter/Views/Pages/category_videos.dart';
import 'package:bodoo_flutter/Views/Pages/instagramtask_screen.dart';
import 'package:bodoo_flutter/Views/Pages/socialmediatask_options.dart';
import 'package:bodoo_flutter/Views/Pages/surveys_screen.dart';
import 'package:bodoo_flutter/Views/Pages/watch_videoScreen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/auth_provider.dart';
import 'invite_friendsScreen.dart';
import 'notifications_Screen.dart';
import 'others_taskScreen.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  void initState() {
    // TODO: implement initState
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 347,
                    width:428,
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
                            Text("Task",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                             InkWell
                               (
                               onTap: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                               },
                                 child: Image.asset('assets/icons/notification.png',height: 25,width: 25,),
                             ),
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
                  child: Consumer<LevelProvider>(

                    builder: (context, levelProvider,child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 35.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:  [
                                        Text("${levelProvider.taskLevel!.subscription}",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),),
                                        SizedBox(height: 10),
                                        Text("Complete ${levelProvider.taskLevel!.remainingTasks} more task to",style: TextStyle(color: Colors.grey,fontSize: 15),),
                                        Text("reach  ${levelProvider.taskLevel!.subscription}",style: TextStyle(color: Colors.grey,fontSize: 15),),
                                      ],
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Column(
                                    children: [
                                    CircularPercentIndicator(
                                      backgroundColor: Colors.white,
                                    radius: 60.0,
                                    lineWidth: 14.0,
                                    animation: true,
                                    percent: 0.75,
                                    center:  Text(
                                      levelProvider.taskLevel!.totalReward.toString(),
                                      style:
                                       TextStyle(fontWeight: FontWeight.bold, fontSize: 25.11),
                                    ),
                                      // progressColor:Colors.greenAccent,
                                      linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                                    ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Task Categories",style: TextStyle(fontWeight: FontWeight.w600,fontSize:18 ),),
                               SizedBox(height: 5),
                                Text("Complete the following number of tasks",style: TextStyle(color: Colors.grey,fontSize: 18),),
                              ],
                            ),
                          ),
                             SizedBox(height: 25),
                           Expanded(
                             child: SingleChildScrollView(
                               child: Column(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left: 10.0,right: 10),
                                     child: Column(
                                       children: [
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
                                                 Text("Watch Videos",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                                                 Text("${levelProvider.completedVideos}/${levelProvider.totalVideos}"),
                                               ],
                                             ),
                                           ),
                                           subtitle: LinearPercentIndicator(
                                             barRadius: Radius.circular(15.0),
                                             animation: true,
                                             lineHeight: 12,
                                            // percent: double.parse(levelProvider.completedVideos.toString())/double.parse(levelProvider.totalVideos.toString()),
                                             percent: levelProvider.totalVideos == 0 ?  levelProvider.completedVideos/1 : levelProvider.completedVideos/levelProvider.totalVideos,
                                             //percent:0,
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
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryVideos()));
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
                                                     Text("Social Media Reacts",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
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
                                                // percent:0.5,
                                                 percent: levelProvider.totalForms == 0 ?  levelProvider.completedForms/1 : levelProvider.completedForms/levelProvider.totalForms,

                                                 //percent: double.parse(levelProvider.completedForms)/double.parse(levelProvider.totalForms),
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
                                                 Provider.of<SurveyProvider>(context,listen: false).getSurveys(context);
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

                                                 //percent: double.parse(levelProvider.invites)/double.parse(levelProvider.maxInvites),
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
                                               onTap: () async {
                                                 await Provider.of<AuthProvider>(context,listen: false).inviteFirends(context);
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
                                   ),
                                 ],
                               ),
                             ),
                           ),
                        ],
                      );
                    }
                  ),
                ),
              ),

            ],
          ),
        ),
    );
  }
}
