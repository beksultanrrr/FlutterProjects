import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(const VideoApp());

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.play();
    _controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
          body: Stack(children: <Widget>[
        VideoPlayer(_controller),
        Center(
          child: Container(
            // margin: EdgeInsets.all(32.0),

            child: Container(
              color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 199, vertical: 119),
              height: 600,
              width:700,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "977777",
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ],
                // children: <Widget>[
                // TextField(
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     hintText: "977777",
                //     contentPadding: EdgeInsets.symmetric(horizontal: 70,),
                //     filled: true,
                //     fillColor: Colors.white
                //   ),
                // ),

                // ],
              ),
            ),
          ),
        )
      ])),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
