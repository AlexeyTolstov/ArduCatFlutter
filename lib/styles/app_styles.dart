import 'package:ArduinoSimulator/styles/app_colors.dart';
import 'package:flutter/material.dart';


abstract class ApplicationStyles {
  static const ApplicationColors applicationColors = ApplicationColors(
    textBackgroundColor: Colors.white,

    fullItemColor: Colors.white,
    halfEmptyColor: Color.fromARGB(255, 239, 239, 239),
    emptyItemColor: Color(0xFFC8C8C8),

    borderItemColor: Color(0xFFE7E7E7),
    borderShadowColor: Color(0xFFE7E7E7),
    
    textColor: Colors.black,
    dropDeviceBackgroundColor: Color(0xffF5F5F5),
    completeColor: Color(0xFF3EBA2E),
    resetColor: Color(0xFF646464),
    iconStrokeColor: Colors.white,
  );
  
  static const double widthTaskDeviceRow = 600;
  static const double heightTaskWidget = 500;
}