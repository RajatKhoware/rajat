// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tambola_frontend/view/constants/colors.dart';
import 'package:tambola_frontend/view/components/navbar/navigation_item.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({Key? key}) : super(key: key);

//todo: convert icon to icon button
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kBackgroundGradient1, kBackgroundGradient2])),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            NavigationItem(
              isSelected: true,
              icon: Icon(Icons.play_arrow_rounded, color: textColor1, size: 38,),
            ),
            NavigationItem(
              icon: Icon(
                Icons.wallet_rounded,
                size: 38,
                color: Colors.white,
              ),
            ),
            NavigationItem(
              icon: Icon(
                Icons.leaderboard_rounded,
                size: 38,
                color: Colors.white,
              ),
            ),
            NavigationItem(
              icon: Icon(
                Icons.person_rounded,
                size: 38,
                color: Colors.white,
              ),
            )
          ]),
    );
  }
}

class RadiantGradientMask extends StatelessWidget {
  final Widget child;
  const RadiantGradientMask({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: [textColor1, textColor2],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
