import 'package:flutter/material.dart';
import 'package:tambola_frontend/view/screens/Signup/widgets/sign_up_card_4.dart';

class NewSignUpScreen3 extends StatefulWidget {
  final String userName;
  NewSignUpScreen3({Key? key, required this.userName}) : super(key: key);

  @override
  State<NewSignUpScreen3> createState() => _NewSignUpScreen2State();
}

class _NewSignUpScreen2State extends State<NewSignUpScreen3> {
  // late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    //   _controller = VideoPlayerController.asset("assets/videos/nobots_video.mov")
    //     ..initialize().then((_) {
    //       _controller.play();
    //       _controller.setLooping(false);
    //       // Ensure the first frame is shown after the video is initialized
    //       setState(() {});
    //     });
  }

  @override
  Widget build(BuildContext context) {
    return
        //  ScreenUtilInit(
        //     builder: (context, child) =>
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
                child: Image.asset("assets/gifs/part_4.gif"),
              ),
            ),
          ),
          SizedBox.expand(
            child: Padding(
                padding: EdgeInsets.only(bottom: 10, left: 15, right: 15),
                child: SignUpCard4(
                  userName: widget.userName,
                  mobile: "",
                )),
          )
        ],
      ),
    );
    //         ),
    //       ],
    //     ),
    //   ),
    //   designSize: const Size(428, 926),
    // );
  }
}
