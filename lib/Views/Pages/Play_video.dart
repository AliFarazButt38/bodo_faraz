import 'package:flutter/material.dart';
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
    return Scaffold(

      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 300),
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Stack(
                      children: [
            ImageIcon(AssetImage("assets/icons/cross.png"),color: Colors.white,size: 50,),

                        Positioned
                          (child: ImageIcon(AssetImage("assets/icons/NewCross.png"),size: 30,),
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
                        padding: const EdgeInsets.only(top: 10),
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
                            Image.asset("assets/images/videoIcon.png", height: 100, width: 100),
                            SizedBox(height: 5),
                            Text(
                              "Tap to play",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
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
                top: 280,
                child: Container(
                height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
    color: Colors.white,
    ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,top: 20,right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Add a title to your video",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      SizedBox(height: 10,),
                        Text("Task Description",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                      Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. t to Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        maxLines: 12,
                        overflow: TextOverflow.ellipsis,
                         style: TextStyle(fontSize: 20),
                      ),

                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 55),
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
                                width: 250,
                                height: 47,
                                alignment: Alignment.center,
                                child: const Text(
                                  'Mark as complete',
                                  style:
                                  const TextStyle(fontSize: 18, ),
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
