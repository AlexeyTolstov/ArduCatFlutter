import 'package:ArduinoSimulator/data/device_data.dart';
import 'package:ArduinoSimulator/data/identifications/point_id.dart';
import 'package:ArduinoSimulator/data/mixins/point_position.dart';
import 'package:ArduinoSimulator/data/mixins/position.dart';
import 'package:flutter/material.dart';

class ContactData with Position {
  final PointId id = PointId();
  final Offset offset;
  
  final String nameContact;
  late final DeviceData device;

  bool isHover = false;
  bool isSelected = false;
  
  late final bool mayUse;
  get nameDevice => device.name;

  @override
  String toString() => "$nameDevice: $nameContact";

  get point => PointPosition(x, y, id);

  ContactData({
    required this.offset,
    required this.nameContact,
  });
}