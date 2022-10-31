import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tambola_frontend/view/screens/Signup/widgets/sign_up_card_4.dart';
import 'package:video_player/video_player.dart';

class SignUpArg {
  final String mobile;
  final String userName;

  SignUpArg({required this.mobile,required this.userName});
}

class NewSignUpScreen4 extends StatefulWidget {
  const NewSignUpScreen4({
    Key? key,
  }) : super(key: key);
  // final String mobile;
  @override
  State<NewSignUpScreen4> createState() => _NewSignUpScreen2State();
}

class _NewSignUpScreen2State extends State<NewSignUpScreen4> {
  // late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // _controller =
    //     VideoPlayerController.asset("assets/videos/features_video.mov")
    //       ..initialize().then((_) {
    //         _controller.play();
    //         _controller.setLooping(false);
    //         // Ensure the first frame is shown after the video is initialized
    //         setState(() {});
    //       });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SignUpArg;
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
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 52.h, bottom: 10.h, left: 10.w, right: 10.w),
              child: SignUpCard4(
                userName: args.userName,
                mobile: args.mobile,
              ),
            ),
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
