import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';


class PlayVideo extends StatefulWidget {
  String urlYoutube;
   PlayVideo({Key? key,required this.urlYoutube}) : super(key: key);

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    print('url youtube ${widget.urlYoutube}');
    _controller = VideoPlayerController.network(
        widget.urlYoutube)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    print('url youtube 1 ${widget.urlYoutube}');
  }

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
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Stack(
                      children: [
                        Positioned
                          (
                          child: Image.asset("assets/icons/Full Cross.png",height: 30.h,width: 30.w,),
                          top: 10,
                          left: 10,
                        ),
                      ],
                      ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: 10.h),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)
                          ),
                          child: Center(
                            child: _controller.value.isInitialized
                                ? AspectRatio(
                              aspectRatio: 1.6,
                              child: VideoPlayer(_controller),
                            )
                                : Container(),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 70,
                        left: 150,
                        child:_controller.value.isPlaying ?SizedBox(): Column(
                          children: [
                            Image.asset("assets/images/videoIcon.png", height: 70.h, width: 70.w),
                            SizedBox(height: 5.h),
                            Text(
                              "Tap to play",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
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
                        SizedBox(height: 20.h,),
                        Padding(
                          padding:  EdgeInsets.only(left: 55.w),
                          child: ElevatedButton(
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
                                width: 294.w,
                                height: 42.h,
                                alignment: Alignment.center,
                                child:  Text(
                                  'Mark as complete',
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
                ),
              ),
          ],
        ),
      ),
    );
  }
}
