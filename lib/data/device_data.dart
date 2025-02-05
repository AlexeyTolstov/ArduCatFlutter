import 'package:ArduinoSimulator/data/contact_data.dart';
import 'package:ArduinoSimulator/data/identifications/device_id.dart';
import 'package:ArduinoSimulator/data/mixins/position.dart';
import 'package:ArduinoSimulator/data/mixins/size.dart';
import 'package:flutter/material.dart';

class DeviceData with Position, Size {
  final DeviceId id = DeviceId();
  final String name;
  final Image image;
  bool isDropped;

  final List<ContactData> contacts;

  DeviceData({
    required this.name,
    required this.contacts,
    required this.image,
    this.isDropped = false
  }) {
    width = image.width ?? 0;
    height = image.height ?? 0;
  }
}