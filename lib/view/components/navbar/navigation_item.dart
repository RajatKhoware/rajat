import 'package:flutter/material.dart';
import 'package:tambola_frontend/view/constants/colors.dart';

class NavigationItem extends StatelessWidget {
  final Icon icon;
  final bool isSelected;
  const NavigationItem({required this.icon, this.isSelected = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: isSelected == false
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [textColor1, textColor2])
            : const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(255, 72, 72, 72), Colors.black]),
      ),
      child: icon,
    );
  }
}
