import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tambola_frontend/view/screens/Signup/widgets/sign_up_card_1.dart';
import 'package:video_player/video_player.dart';

class NewSignUpScreen extends StatefulWidget {
  const NewSignUpScreen({Key? key}) : super(key: key);

  @override
  State<NewSignUpScreen> createState() => _NewSignUpScreenState();
}

class _NewSignUpScreenState extends State<NewSignUpScreen> {
  // late VideoPlayerController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller =
  //       VideoPlayerController.asset("assets/videos/rooms_video.mov")
  //         ..initialize().then((_) {
  //           _controller.play();
  //           _controller.setLooping(false);
  //           // Ensure the first frame is shown after the video is initialized
  //           setState(() {});
  //         });
  // }

  @override
  Widget build(BuildContext context) {
    return
        // ScreenUtilInit(
        //   builder: (context, child) =>
        Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                // width: _controller.value.size.width,
                // height: _controller.value.size.height,
                // child: VideoPlayer(_controller),
                child: Image.asset("assets/gifs/part_2.gif"),
              ),
            ),
          ),
          SizedBox.expand(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10, left: 15, right: 15),
              child: SignUpCard1(),
            ),
          )
          // Padding(
          //   padding: EdgeInsets.only(
          //       top: 300.h, bottom: 30.h, left: 15.w, right: 15.w),
          //   child: SignUpCard1(),
          // ),
        ],
      ),
    );
    //     ],
    //   ),
    // ),
    //   designSize: const Size(428, 926),
    // );
  }
}
