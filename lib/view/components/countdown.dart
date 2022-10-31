import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CountDownPage extends StatefulWidget {
  const CountDownPage({Key? key}) : super(key: key);

  @override
  State<CountDownPage> createState() => _CountDownPageState();
}

//list of all the numbers on the board
List<int> allNumbers = List.generate(90, (index) => index + 1);
//initializing a list of numbers which are called from the backend
List<int> calledNumbers = [];
int currentNumber = 0;

class _CountDownPageState extends State<CountDownPage> {
  static const countdownDuration = Duration(seconds: 5);
  Duration duration = Duration();
  Timer? timer;

  bool isCountdown = true;

  // @override
  // void initState() {
  //   super.initState();
  //   startTimer();
  //   reset();
  // }

  // void reset() {
  //   if (isCountdown) {
  //     setState(() => duration = countdownDuration);
  //   } else {
  //     setState(() => duration = Duration());
  //   }
  // }

  // void addTime() {
  //   final addmilliseconds = isCountdown ? -1 : 1;
  //   setState(() {
  //     final milliseconds = duration.inMilliseconds + addmilliseconds;
  //     if (milliseconds < 0) {
  //       timer?.cancel();
  //     } else {
  //       duration = Duration(milliseconds: milliseconds);
  //     }
  //   });
  // }

  // void startTimer() {
  //   timer = Timer.periodic(Duration(milliseconds: 1), (_) => addTime());
  // }

  // getNextNumber() {
  //   //generate a random number
  //   if (allNumbers.isEmpty) {
  //     int randomNumber = allNumbers[Random.secure().nextInt(allNumbers.length)];
  //     setState(() {
  //       //current number called
  //       currentNumber = randomNumber;
  //       //removing the current number from the list
  //       //to avoid repetition of numbers
  //       allNumbers.remove(randomNumber);
  //       calledNumbers.add(randomNumber);
  //     });
  //   } else {
  //     showSnackBarText(context, "GAME OVER!");
  //     timer?.cancel();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Column(
        children: [
          Expanded(
              child: SizedBox(
            height: 27.h,
            width: 87.w,
            child: buildTime(),
          )),
        ],
      ),
    );
  }

  buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final milliseconds = twoDigits(duration.inMilliseconds.remainder(60));
    final microseconds = twoDigits(duration.inMicroseconds.remainder(60));

    return GradientText(
      '$seconds:$milliseconds:$microseconds',
      style: TextStyle(
        fontSize: 20.0.sp,
        fontWeight: FontWeight.w500,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(4.0, 4.0),
            blurRadius: 10.0,
            color: Color.fromARGB(123, 51, 51, 51),
          ),
        ],
      ),
      gradientType: GradientType.linear,
      gradientDirection: GradientDirection.ttb,
      radius: .5,
      colors: [
        fromCssColor('#FF2020'),
        fromCssColor('#A70000'),
      ],
    );
  }
}
