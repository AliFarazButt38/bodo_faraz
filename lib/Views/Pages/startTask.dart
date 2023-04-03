import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartTask extends StatefulWidget {
  const StartTask({Key? key}) : super(key: key);

  @override
  State<StartTask> createState() => _StartTaskState();
}

class _StartTaskState extends State<StartTask> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(388, 840));
    return Scaffold(
backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            Column(

              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 300.w),
                  child: Image.asset("assets/icons/Full Cross.png",height: 30.h,width: 30.w,),
                ),
                SizedBox(height: 10.h,),
                Image.asset("assets/images/SocialMedia2.png",height: 261.h,width: 388.w,fit: BoxFit.cover,),
              ],
            ),

            Positioned.fill(
              top: 230,
              child: Container(
                height: 399.h,
                width: 388.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: 25.w,top: 20.h,right: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Add a title to your video",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),),
                      SizedBox(height: 10.h,),
                      Text("Task Description",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.sp),),
                      SizedBox(height: 10.h,),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        maxLines: 15,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13.sp),
                      ),


                    ],
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
