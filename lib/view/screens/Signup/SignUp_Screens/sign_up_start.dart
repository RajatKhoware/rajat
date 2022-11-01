import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tambola_frontend/view/screens/Signup/widgets/start_card.dart';
import 'package:video_player/video_player.dart';

class SignUpStart extends StatefulWidget {
  const SignUpStart({Key? key}) : super(key: key);

  @override
  State<SignUpStart> createState() => _SignUpStartState();
}

class _SignUpStartState extends State<SignUpStart> {
  // late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.asset("assets/images/welcome_video.mp4")
    //   ..initialize().then((_) {
    //     _controller.play();
    //     _controller.setLooping(false);
    //     // Ensure the first frame is shown after the video is initialized
    //     setState(() {});
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  // width: _controller.value.size.width,
                  // height: _controller.value.size.height,
                  // child: VideoPlayer(_controller),
                  child: Image.asset("assets/gifs/part_1.gif"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 512.h, bottom: 30.h, left: 15.w, right: 15.w),
              child: StartCard0(),
            ),
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
