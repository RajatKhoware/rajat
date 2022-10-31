import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Gradient buttonBackgroundGradient;
  final Gradient buttonGradient;
  final String buttonText;
  final double fontSize;
  final Color textColor;
  final double verticalPadding;
  final double horizontalPadding;
  final Widget destinationPage;

  const GradientButton(
      {required this.buttonBackgroundGradient,
      required this.buttonGradient,
      required this.buttonText,
      this.fontSize = 23,
      this.textColor = Colors.white,
      this.horizontalPadding = 5,
      this.verticalPadding = 15,
      required this.destinationPage,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: buttonBackgroundGradient),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), gradient: buttonGradient),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => destinationPage));
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          child: Text(
            buttonText,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
