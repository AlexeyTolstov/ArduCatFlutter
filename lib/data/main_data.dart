import 'package:ArduinoSimulator/data/device_data.dart';
import 'package:ArduinoSimulator/data/wire.dart';
import 'package:flutter/material.dart';

class MainData extends ChangeNotifier {
  List<DeviceData> deviceList = [];
  List <Wire> wireList = [];

  void Function()? onComplete;
  void Function()? onReset;
  void Function() updateData;

  MainData({
    required this.deviceList,
    required this.wireList,
    required this.onComplete,
    required this.updateData,
    required this.onReset,
  });
}