import 'package:bodoo_flutter/Providers/community_provider.dart';
import 'package:bodoo_flutter/Views/Pages/notifications_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_stack/image_stack.dart';
import 'package:provider/provider.dart';

import '../../Theme/palette.dart';

List<String> images = ["https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1800&t=st=1678861722~exp=1678862322~hmac=64db2cad4d20ee07362021ab8c800a48daafd8ccaf741206c82d8c8a01566620", 'https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1800&t=st=1678861722~exp=1678862322~hmac=64db2cad4d20ee07362021ab8c800a48daafd8ccaf741206c82d8c8a01566620','https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1800&t=st=1678861722~exp=1678862322~hmac=64db2cad4d20ee07362021ab8c800a48daafd8ccaf741206c82d8c8a01566620',"https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1800&t=st=1678861722~exp=1678862322~hmac=64db2cad4d20ee07362021ab8c800a48daafd8ccaf741206c82d8c8a01566620", 'https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1800&t=st=1678861722~exp=1678862322~hmac=64db2cad4d20ee07362021ab8c800a48daafd8ccaf741206c82d8c8a01566620','https://img.freepik.com/free-photo/full-shot-travel-concept-with-landmarks_23-2149153258.jpg?3&w=1800&t=st=1678861722~exp=1678862322~hmac=64db2cad4d20ee07362021ab8c800a48daafd8ccaf741206c82d8c8a01566620'];


class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CommunityProvider>(context, listen: false).getUserCommunity(context);
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
                    padding: EdgeInsets.only(left: 20.0.w,right: 20.0.w,top: 50.h),
                    child: Row(
                      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text("Community",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),),
                        InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                            },
                          child: Padding(
                            padding:  EdgeInsets.only(top: 6.h),
                            child: Image.asset('assets/icons/notification.png',height: 20.h,width: 19.w,),
                          ),
                        ),
                          ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned.fill(
              top: 120,
              child: Container(
                height: 780.h,
                width: 428.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
                  color: Colors.white,
                ),
                child: Consumer<CommunityProvider>(

                  builder: (context, communityProvider,child) {
                    if(communityProvider.communityLoading){
                      return Center(child: Image.asset('assets/gif/Loading.gif', height: 100,width: 100,));
                    }else if(communityProvider.communityList.isNotEmpty){
                      return   ListView.builder(
                          itemCount: communityProvider.communityList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                            return Padding(
                              padding:  EdgeInsets.only(top: 20,left: 20,right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: [
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
                                      SizedBox(width: 20,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(communityProvider.communityList[index].name, style: TextStyle(color: Palette.black,fontSize: 16,fontWeight: FontWeight.bold),),
                                          Text('Level 1 - Grade 1', style: TextStyle(color: Palette.grey74,fontSize: 14,),),
                                        ],
                                      ),
                                    ],
                                  ),


                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[

                                         // SizedBox(width: 20,),
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
                    }else{
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Image.asset("assets/images/community.png",height: 352.h,width: 352.w,),
                          ),
                          Text("No one Join",style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 22.sp,
                          ),),
                          Text("Your Community yet",style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                          ),),
                          SizedBox(height: 30.h,),
                          ElevatedButton(
                            onPressed: () {

                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient:
                                  const LinearGradient(colors: [Colors.blueAccent, Colors.greenAccent]),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                width: 241.w,
                                height: 42.w,
                                alignment: Alignment.center,
                                child:  Text(
                                  'Invite',
                                  style:
                                  TextStyle(fontSize: 16.sp, ),
                                ),
                              ),
                            ),
                          ),


                        ],
                      );
                    }

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

