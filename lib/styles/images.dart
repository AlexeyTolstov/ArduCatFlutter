import 'package:flutter/material.dart';

abstract class AppImages {
  static Image arduinoUNO = Image.asset(
    "assets/images/ArduinoUno.png",
    width: 499,
    height: 363,
  );

  static final Image lightRed = Image.asset(
    "assets/images/LightRed.png",
    width: 32,
    height: 100,
  );

  static final Image mainHero = Image.asset("assets/images/catShark.jpg");
  static final Image cup = Image.asset("assets/images/cup.png");
  static final Image progress = Image.asset("assets/images/progress.jpg");
  static final Image utils = Image.asset("assets/images/utils.png");
}

abstract class AppDevicesImages {
  static final Image lightRedOff = Image.asset("assets/images/Light.png");
  static final Image arduinoUno = Image.asset("assets/images/Arduino Uno.png");
}
