import 'package:bodoo_flutter/Views/Pages/notifications_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
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
                child: Column(
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
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

