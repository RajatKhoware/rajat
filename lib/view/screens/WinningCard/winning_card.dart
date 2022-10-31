import 'package:flutter/material.dart';
import 'package:tambola_frontend/view/constants/gradients.dart';
import 'package:tambola_frontend/view/components/custom_text.dart';
import 'package:tambola_frontend/view/components/gradient_text.dart';
import 'package:tambola_frontend/view/constants/new_gradints.dart';

class WinningCard extends StatelessWidget {
  const WinningCard({Key? key, this.winType = const [], this.winPrize = 0})
      : super(key: key);
  final List<String>? winType;
  final int winPrize;
  @override
  Widget build(BuildContext context) {
    String wins = winType!.toString();
    Size size = MediaQuery.of(context).size;
    return
        //  Scaffold(
        // body:
        Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      height: size.height / 1.5,
      width: 359,
      decoration: BoxDecoration(
          gradient: blueGradient,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 191, 191, 191),
                offset: Offset(2, 1),
                spreadRadius: 1,
                blurRadius: 1)
          ]),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Image(
          image: AssetImage('assets/images/winning_icon.png'),
        ),
        SizedBox(
          height: size.width / 44,
        ),
        CoustomGradientText(
          textAlign: TextAlign.center,
          text: "CONGRATULATIONS",
          gradient: newfireliner,
          style: CustomTextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Theme.of(context).textTheme.titleLarge!.fontSize!,
              fontFamily: 'Inter'),
        ),
        SizedBox(
          height: size.width / 44,
        ),
        CoustomGradientText(
          textAlign: TextAlign.center,
          text: "YOU WON ",
          gradient: metallicGradient,
          style: CustomTextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Theme.of(context).textTheme.titleMedium!.fontSize!,
              fontFamily: 'Inter'),
        ),
        SizedBox(
          height: size.width / 44,
        ),
        CoustomGradientText(
          textAlign: TextAlign.center,
          text: wins.substring(1, wins.length - 1),
          // text: "Fetching failed",
          gradient: metallicGradient,
          style: CustomTextStyle(
              fontWeight: FontWeight.w400,
              fontSize: Theme.of(context).textTheme.titleMedium!.fontSize!,
              fontFamily: 'Inter'),
        ),
        CoustomGradientText(
          text: winPrize.toString(),
          gradient: newfireliner,
          style: CustomTextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Inter'),
        ),
        SizedBox(
          height: size.width / 44,
        ),
        CoustomGradientText(
          textAlign: TextAlign.center,
          text: 'YOUR REWARD WILL BE ADDED IN YOUR WALLET',
          gradient: metallicGradient,
          style: CustomTextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Inter'),
        ),
        SizedBox(
          height: size.width / 54,
        ),
      ]),
    );
  }
}
