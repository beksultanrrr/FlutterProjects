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
          resizeToAvoidBottomInset: false,
          body: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
            VideoPlayer(_controller),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25.0),
                    padding: EdgeInsets.only(top: 34.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(20.0)),
                      color: Color.fromRGBO(39, 39, 39, 1),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Text(
                          "Cheflist",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: "cera-round-pro2"),
                        ),
                        SizedBox(height: 48.0),
                        Text(
                          "Авторизация",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: "cera-round-pro2"),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Text(
                          "Пожалуйста выберите способ авторизации",
                          style: TextStyle(
                            color: Color.fromRGBO(159, 170, 174, 1),
                            fontSize: 12,
                            fontFamily: "cera-round-pro2",
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 15)),
                            const SizedBox(
                              width: 75,
                              height: 50,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "",
                                    filled: true,
                                    fillColor: Color.fromRGBO(54, 54, 54, 1)),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(left: 15)),
                            const SizedBox(
                              width: 293,
                              height: 50,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "+971(__)__-__-__",
                                    filled: true,
                                    fillColor: Color.fromRGBO(54, 54, 54, 1)),
                                style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: "cera-round-pro2",
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        SizedBox(
                            width: 380,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Отправить",
                                style: TextStyle(
                                  color: Color.fromRGBO(54, 54, 54, 1),
                                  fontSize: 15,
                                  fontFamily: "cera-round-pro2",
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            )),
                        Padding(padding: EdgeInsets.only(top: 50)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              color: Color.fromRGBO(54, 54, 54, 1),
                              textColor: Colors.white,
                              child: Icon(
                                Icons.apple,
                                size: 40,
                              ),
                              padding: EdgeInsets.all(5),
                              shape: CircleBorder(),
                            ),
                            MaterialButton(
                              onPressed: () {},
                              color: Color.fromRGBO(54, 54, 54, 1),
                              textColor: Color.fromARGB(255, 45, 3, 230),
                              child: Icon(
                                Icons.facebook_sharp,
                                size: 40,
                              ),
                              padding: EdgeInsets.all(5),
                              shape: CircleBorder(),
                            ),
                            MaterialButton(
                              onPressed: () {},
                              color: Color.fromRGBO(54, 54, 54, 1),
                              textColor: Colors.white,
                              child: Icon(
                                Icons.apple,
                                size: 40,
                              ),
                              padding: EdgeInsets.all(5),
                              shape: CircleBorder(),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        TextButton(
                            onPressed: () {},
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(fontSize: 13),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: "или ",
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              159, 170, 174, 1))),
                                  TextSpan(
                                      text: "продолжить как гость",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(159, 170, 174, 1),
                                          decoration: TextDecoration.underline))
                                ])))
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: const Image(
                      image: NetworkImage(
                          "https://img.freepik.com/premium-vector/chef-logo-vector_20448-270.jpg"),
                      height: 50,
                      width: 50,
                      alignment: Alignment(0, -1.3),
                    ),
                  ),
                ],
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
