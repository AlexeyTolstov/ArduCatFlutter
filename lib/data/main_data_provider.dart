import 'package:ArduinoSimulator/data/main_data.dart';
import 'package:flutter/material.dart';

class MainDataProvider extends InheritedNotifier<MainData> {
  const MainDataProvider({
    super.key,
    required MainData super.notifier,
    required super.child,
  });

  static MainData of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MainDataProvider>()!
        .notifier!;
  }
}