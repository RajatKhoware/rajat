import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tambola_frontend/view/screens/Signup/widgets/sign_up_card_1.dart';
import 'package:tambola_frontend/view/screens/Signup/widgets/sign_up_card_2.dart';
import 'package:video_player/video_player.dart';

class SignUpNameArg {
  final String userName;

  SignUpNameArg({required this.userName});
}

class NewSignUpScreen2 extends StatefulWidget {
  const NewSignUpScreen2({
    Key? key,
  }) : super(key: key);
  @override
  State<NewSignUpScreen2> createState() => _NewSignUpScreen2State();
}

class _NewSignUpScreen2State extends State<NewSignUpScreen2> {
  // late VideoPlayerController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.asset("assets/videos/money_video.mov")
  //     ..initialize().then((_) {
  //       _controller.play();
  //       _controller.setLooping(false);
  //       // Ensure the first frame is shown after the video is initialized
  //       setState(() {});
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SignUpNameArg;
    return
        // ScreenUtilInit(
        // builder: (context, child) =>
        Scaffold(
      body:
          // SizedBox(
          //   height: double.infinity,
          // child: Stack(
          //   children: <Widget>[
          // SizedBox.expand(
          //   child: FittedBox(
          //     fit: BoxFit.cover,
          //     child: SizedBox(
          // width: _controller.value.size.width,
          // height: _controller.value.size.height,
          // child: VideoPlayer(_controller),
          //     ),
          //   ),
          // ),
          Container(
        // margin: EdgeInsets.only(top: 368.h),
        height: double.infinity,
        alignment: Alignment.bottomCenter,
        child: SignUpCard2(userName: args.userName),
      ),

      // ],
      // ),
      // ),
      // ),
      // designSize: const Size(428, 926),
    );
  }
}
