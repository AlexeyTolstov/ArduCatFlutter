import 'package:ArduinoSimulator/data/contact_data.dart';
import 'package:ArduinoSimulator/data/device_data.dart';
import 'package:ArduinoSimulator/devices/contact_names.dart';
import 'package:ArduinoSimulator/devices/device_names.dart';
import 'package:ArduinoSimulator/styles/images.dart';
import 'package:flutter/material.dart';

class LightRed extends DeviceData {
  LightRed() : super(
    name: DeviceNames.lightRed,
    image: AppImages.lightRed,
    contacts: [
      ContactData(
        offset: const Offset(3, 90),
        nameContact: ContactNames.cGND,
      ),
      ContactData(
        offset: const Offset(19, 90),
        nameContact: ContactNames.cVCC,
      ),
    ],
  ) {
    for (ContactData c in contacts) {
      c.device = this;
      c.mayUse = true;
    }
  }
}