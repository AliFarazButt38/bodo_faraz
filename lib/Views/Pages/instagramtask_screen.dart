
import 'package:bodoo_flutter/Providers/level_provider.dart';
import 'package:bodoo_flutter/Providers/socialMedia_provider.dart';
import 'package:bodoo_flutter/Theme/palette.dart';
import 'package:bodoo_flutter/Views/Pages/social_detail_page.dart';
import 'package:bodoo_flutter/Views/Pages/startTask.dart';
import 'package:bodoo_flutter/Views/Pages/webview_instagram.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'notifications_Screen.dart';

class ListItem {
  final String image;
  final String title;
  final String description;
  ListItem({
    required this.image,
    required this.title,
    required this.description,
  });
}
List<ListItem> items = [
  ListItem(
    image: "assets/images/SocialMedia2.png",
    title: "Add a Title to your Video",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it",
  ),
  ListItem(
    image: "assets/images/SocialMedia2.png",
    title: "Add a Title to your Video",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it",
  ),
  ListItem(
    image: "assets/images/SocialMedia2.png",
    title: "Add a Title to your Video",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it",
  ),
];


class InstagramTask extends StatefulWidget {
  const InstagramTask({Key? key}) : super(key: key);

  @override
  State<InstagramTask> createState() => _InstagramTaskState();
}


class _InstagramTaskState extends State<InstagramTask> {
  @override
  void initState() {
    super.initState();
    Provider.of<SocialMediaProvider>(context,listen: false).getInstagramPost(context);
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
                  height: 500,
                  width:MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    // color: Colors.blueAccent,
                    gradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 35),
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

                          Text("Instagram Tasks",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
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
              top: 140,
              child: Container(
                height: 735.h,
                width: 428.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:  EdgeInsets.only(top: 90.h,left: 20.w,right: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Consumer<SocialMediaProvider>(

                          builder: (context, socialMediaProvider, child) {
                            if(socialMediaProvider.taskLoading){
                              return Center(child: CircularProgressIndicator(color: Palette.baseElementGreen,));
                            }else if(socialMediaProvider.socialTasksList.isNotEmpty){
                              return ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: socialMediaProvider.socialTasksList.length,
                                separatorBuilder: (BuildContext context,int index){
                                  return SizedBox(height: 20.h,);
                                },// Replace itemCount with the actual number of list items you want to display
                                itemBuilder: (context, index) {
                                  final item = items[index];
                                  return InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (contex)=>StartTask()));
                                    },
                                    child: Container(
                                      height: 353.h,
                                      width: 388.w,
                                      padding: EdgeInsets.only(top: 5.h,left: 8.w,right: 8,bottom: 8.h),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 1,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
                                            child: Image.asset(
                                              item.image,
                                              height: 164.h,
                                              width:388.23.w,
                                              fit: BoxFit.cover,

                                            ),
                                          ),

                                          SizedBox(height: 10.h),
                                          Padding(
                                            padding:  EdgeInsets.only(left: 15.w),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children:[
                                                Text(
                                                 socialMediaProvider.socialTasksList[index].action,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 14.31.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(height: 10.h),
                                                Text(
                                                  item.description,
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10.h),
                                          Padding(
                                            padding:  EdgeInsets.only(left: 55.w),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => SocialDetailPage(socialMediaModel: socialMediaProvider.socialTasksList[index])));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  padding: EdgeInsets.zero,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10))),
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                    gradient:
                                                    const LinearGradient(colors: [Colors.blueAccent, Colors.greenAccent]),
                                                    borderRadius: BorderRadius.circular(10)),
                                                child: Container(
                                                  width: 274.w,
                                                  height: 42.h,
                                                  alignment: Alignment.center,
                                                  child:  Text(
                                                    'Start Task',
                                                    style:
                                                    TextStyle(fontSize: 16.sp, ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }else{
                              return SizedBox();
                            }

                          }
                        ),

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
                                  Text("Instagram Tasks",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                                  Text("${levelProvider.completedInstaPost}/${levelProvider.totalInstaPost}"),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: LinearPercentIndicator(
                                  barRadius: Radius.circular(15.0),
                                  animation: true,
                                  lineHeight: 12,
                                  percent: levelProvider.totalInstaPost == 0 ?  levelProvider.completedInstaPost/1 : levelProvider.completedInstaPost/levelProvider.totalInstaPost,
                                  // progressColor: Colors.blueAccent,
                                  linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                                  backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text("Complete task to earn points",style: TextStyle(color: Colors.grey,fontSize: 15)),
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
                              ImageIcon(AssetImage('assets/icons/social.png',),size: 25,color: Colors.black,),
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
