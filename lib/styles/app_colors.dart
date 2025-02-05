import 'package:flutter/material.dart';

class ApplicationColors {
  final Color textColor;
  
  final Color textBackgroundColor;
  final Color dropDeviceBackgroundColor;

  final Color resetColor;
  final Color completeColor;
  final Color iconStrokeColor;
  
  final Color borderItemColor;
  final Color borderShadowColor;

  final Color fullItemColor;
  final Color halfEmptyColor;
  final Color emptyItemColor;

  const ApplicationColors({
    required this.fullItemColor,
    required this.halfEmptyColor,
    required this.emptyItemColor,
    required this.textBackgroundColor,
    required this.textColor,
    required this.dropDeviceBackgroundColor,
    required this.resetColor,
    required this.completeColor,
    required this.iconStrokeColor,
    required this.borderItemColor,
    required this.borderShadowColor,
  });
}