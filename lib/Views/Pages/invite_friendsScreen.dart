import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:bodoo_flutter/Providers/level_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import 'notifications_Screen.dart';

class InviteFriends extends StatefulWidget {
  const InviteFriends({Key? key}) : super(key: key);

  @override
  State<InviteFriends> createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  TextEditingController refrenceController = TextEditingController();
  TextEditingController tokenController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refrenceController = TextEditingController(text: Provider.of<AuthProvider>(context,listen: false).inviteUrl);
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      body: SafeArea(child:
      Stack(
        children: [
          Column(
            children: [
              Container(
                height: 300,
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
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child:ImageIcon(AssetImage("assets/icons/backward.png",),size: 30,color: Colors.white,),
                          ),

                          Text("Invite Friends",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                          InkWell
                            (
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                              },
                              child: ImageIcon(AssetImage('assets/icons/notification.png',),size: 25,color: Colors.white,)),
                        ],
                      )
                  ),
                ),
              ),
            ],
          ),
          Positioned.fill(
            top: 140,
            child: Container(
              height: 731.h,
              width: 428.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
                color: Colors.white,
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: 80.h),

                child:SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("Invite your Friends",style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.w600),),
                      SizedBox(height: 5,),
                      Text("Invite & earn points",style: TextStyle(fontSize: 18.sp),),
                      SizedBox(height: 10,),
                      Image.asset("assets/images/gift.png",height: 155.h,width: 179.w,),
                      Padding(
                        padding:  EdgeInsets.only(left: 15.w,right: 15.w,top: 20.h),
                        child: Column(
                          children: [
                            TextFormField(
                              readOnly: true,
                              controller: refrenceController,
                              decoration: InputDecoration(
                                labelText: 'Reference Link',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blueAccent),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blueAccent),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () async {
                                    await Share.share(refrenceController.text);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Container(
                                        height: 20,
                                        width: 20,
                                        child: Image.asset("assets/icons/forward.png",)),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 25.h,),
                      Text("Share your referral code via",style: TextStyle(color: Colors.black,fontSize: 18.sp),),
                      SizedBox(height: 25.h,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await Share.share(refrenceController.text);
                                },
                                child: Container(
                                  width: 110,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset("assets/icons/whatsApp.png",height: 30,width: 30,),

                                      Text("WhatsApp",),
                                    ],
                                  ),
                                ),
                              ),

                              InkWell(
                                onTap: () async {
                                  await Share.share(refrenceController.text);
                                },
                                child: Container(
                                  width: 110,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset("assets/icons/facebook.png",height: 30,width: 30,),

                                      Text("facebook",),
                                    ],
                                  ),
                                ),
                              ),

                              InkWell(
                                onTap: () async {
                                  await Share.share(refrenceController.text);
                                },
                                child: Container(
                                  width: 110,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset("assets/icons/telegram.png",height: 30,width: 30,),

                                      Text("telegram",),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                ),

              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 10,
            right: 10,
            child: Consumer<LevelProvider>(

              builder: (context, levelProvider,child) {
                return Container(
                  width: 388.w,
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
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                Text("Invite Friends",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                                Text("${levelProvider.invites}/${levelProvider.maxInvites}"),

                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: LinearPercentIndicator(
                                barRadius: Radius.circular(15.0),
                                animation: true,
                                lineHeight: 12,
                                percent: levelProvider.maxInvites == 0 ?  levelProvider.invites/1 : levelProvider.invites/levelProvider.maxInvites,

                                // progressColor: Colors.blueAccent,
                                linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                                backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // subtitle: Padding(
                      //   padding: const EdgeInsets.only(top: 20),
                      //   child: Column(
                      //     children: [
                      //       LinearPercentIndicator(
                      //         barRadius: Radius.circular(15.0),
                      //         animation: true,
                      //         lineHeight: 12,
                      //         percent: 0.7,
                      //         // progressColor: Colors.blueAccent,
                      //         linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                      //         backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,
                      //       ),
                      //       SizedBox(height: 5,),
                      //       Text("Watch Videos to Earn points",style: TextStyle(color: Colors.grey,fontSize: 15)),
                      //     ],
                      //   ),
                      // ),

                      leading: Padding(
                        padding: const EdgeInsets.only(left: 8.0,top: 12.0),
                        child: Column(
                          children: const [
                            ImageIcon(AssetImage('assets/icons/invite.png',),size: 30,color: Colors.black,),
                          ],

                        ),
                      ),


                      onTap: () {
                      },
                    ),
                  ),

                );
              }
            ),
          ),



        ],
      ),
      ),
    );
  }
}
