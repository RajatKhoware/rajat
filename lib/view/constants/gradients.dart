import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:tambola_frontend/view/constants/colors.dart';

const Gradient metallicGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 255, 255, 255),
      Color.fromARGB(255, 231, 231, 231),
      Color.fromARGB(255, 202, 202, 202),
      Color.fromARGB(255, 192, 192, 192)
    ],
    stops: [
      0.0,
      0.35,
      0.65,
      0.9
    ]);

Gradient metallicGradientwithOpacity = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 255, 255, 255).withOpacity(0.85),
      Color.fromARGB(255, 231, 231, 231).withOpacity(0.85),
      Color.fromARGB(255, 202, 202, 202).withOpacity(0.85),
      Color.fromARGB(255, 192, 192, 192).withOpacity(0.85),
    ],
    stops: [
      0.0,
      0.35,
      0.65,
      0.9
    ]);

const Gradient fireLinearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [textColor1, textColor2]);

const Gradient blueLiner2Gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [kBackgroundGradient1, kBackgroundGradient2]);

Gradient greyLinerGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    fromCssColor('#FFFFFF'),
    fromCssColor('#909090'),
  ],
);

Gradient maroonGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    fromCssColor('#540000'),
    fromCssColor('#A90000'),
  ],
);

const Gradient greenLinear = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromARGB(255, 0, 242, 24), Color.fromARGB(255, 0, 121, 12)]);

const Gradient darkGreenLinear = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromARGB(255, 3, 141, 0), Color.fromARGB(255, 11, 30, 0)]);

const Gradient redLinear = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromARGB(255, 255, 32, 32), Color.fromARGB(255, 167, 0, 0)]);

const Gradient blackLinear = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(
        255,
        72,
        72,
        72,
      ),
      Color.fromARGB(255, 44, 44, 44)
    ]);

const Gradient blueGradient = RadialGradient(
    colors: [kWalletCardGradient1, kWalletCardGradient2],
    radius: 1.0,
    stops: [0.0, 1.0]);

const Gradient blueGradient2 = RadialGradient(
    colors: [kWalletCardGradient1, kWalletCardGradient2],
    radius: 0.65,
    stops: [0.0, 1.0]);

final Shader textlinearGradient = LinearGradient(
  colors: <Color>[
    fromCssColor('#FFFFFF'),
    fromCssColor('#E7E7E7'),
    fromCssColor('#CACACA'),
    fromCssColor('#C0C0C0'),
  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 0.0, 0.0));

final Shader textlinearGradient2 = LinearGradient(
  colors: [fromCssColor('#484848'), fromCssColor('#2C2C2C')],
).createShader(const Rect.fromLTWH(0.0, 0.0, 0.0, 0.0));

Gradient whitegradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    fromCssColor('#FFFFFF'),
    fromCssColor('#FFFFFF'),
  ],
);
