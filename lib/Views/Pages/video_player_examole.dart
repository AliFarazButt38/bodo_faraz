import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerExample extends StatefulWidget {
  const VideoPlayerExample({Key? key}) : super(key: key);

  @override
  State<VideoPlayerExample> createState() => _VideoPlayerExampleState();
}

class _VideoPlayerExampleState extends State<VideoPlayerExample> {

  late VideoPlayerController _controller;

  String _watchTime= "0:00";

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.addListener(() {
      String formattedTime=_formatTime(_controller.value.position);
     setState(() {
       _watchTime=formattedTime;
     });
    });
  }
String _formatTime(Duration duration){
    String minutes=duration.inMinutes.toString().padLeft(2,'0');
    String seconds=(duration.inSeconds % 60).toString().padLeft(2,'0');
    return '$minutes:$seconds';
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
          child: Text(
            'Watch Time : $_watchTime',style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
