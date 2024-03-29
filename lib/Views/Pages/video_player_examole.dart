// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoPlayerExample extends StatefulWidget {
//   const VideoPlayerExample({Key? key}) : super(key: key);
//
//   @override
//   State<VideoPlayerExample> createState() => _VideoPlayerExampleState();
// }
//
// class _VideoPlayerExampleState extends State<VideoPlayerExample> {
//
//   late VideoPlayerController _controller;
//
//   String _watchTime= "0:00";
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//     _controller.addListener(() {
//       String formattedTime=_formatTime(_controller.value.position);
//      setState(() {
//        _watchTime=formattedTime;
//      });
//     });
//   }
// String _formatTime(Duration duration){
//     String minutes=duration.inMinutes.toString().padLeft(2,'0');
//     String seconds=(duration.inSeconds % 60).toString().padLeft(2,'0');
//     return '$minutes:$seconds';
// }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Center(
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//           aspectRatio: _controller.value.aspectRatio,
//           child: VideoPlayer(_controller),
//         )
//             : Container(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _controller.value.isPlaying
//                 ? _controller.pause()
//                 : _controller.play();
//           });
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
//           child: Text(
//             'Watch Time : $_watchTime',style: TextStyle(fontSize: 18),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerExample extends StatefulWidget {
  const VideoPlayerExample({Key? key}) : super(key: key);

  @override
  State<VideoPlayerExample> createState() => _VideoPlayerExampleState();
}

class _VideoPlayerExampleState extends State<VideoPlayerExample> {

  bool _isPlayerReady = false;
  final stopwatch = Stopwatch();
  bool completionStatus = false;
  double stopWatchTime = 0;
  var roundedWatchedTime = 0;

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  void listener() {
    var totalDuration = 0;
    if (mounted && _controller.value.isPlaying){
      roundedWatchedTime = 0;
      stopwatch.start();
      stopWatchTime = stopwatch.elapsedMilliseconds / 1000;
      roundedWatchedTime = stopWatchTime.round();
    }
    else if (mounted && !_controller.value.isPlaying){
      stopwatch.stop();
    }
    else if (!mounted){
      stopwatch.stop();
      stopwatch.reset();
      roundedWatchedTime = 0;
      stopWatchTime = 0;
    }

    else {
      print('Nothing');
    }

    print('watch time $roundedWatchedTime');
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: <Widget>[
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            onReady: () {
              _controller.addListener(listener);

            },
          ),
        ],
      ),
    );
  }
}
