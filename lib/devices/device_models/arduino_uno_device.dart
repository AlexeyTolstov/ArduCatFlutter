import 'package:ArduinoSimulator/data/contact_data.dart';
import 'package:ArduinoSimulator/data/device_data.dart';
import 'package:ArduinoSimulator/devices/contact_names.dart';
import 'package:ArduinoSimulator/devices/device_names.dart';
import 'package:ArduinoSimulator/devices/methods_device.dart';
import 'package:ArduinoSimulator/styles/images.dart';
import 'package:flutter/material.dart';

class ArduinoUno extends DeviceData {
  ArduinoUno({
    List<String> forbidenContactsList = const [],
    List<String> allowedContactsList = const [],
  }) : super(
          name: DeviceNames.arduinoUno,
          image: AppImages.arduinoUNO,
          contacts: [
            ...createContactsWithShift(
              shift: 17,
              startOffset: const Offset(155, 12),
              listContactsName: [
                null,
                null,
                ContactNames.cAREF,
                ContactNames.cGND,
                ContactNames.cD13,
                ContactNames.cD12,
                ContactNames.cD11,
                ContactNames.cD10,
                ContactNames.cD9,
                ContactNames.cD8,
              ],
            ),
            ...createContactsWithShift(
              shift: 17,
              startOffset: const Offset(335, 12),
              listContactsName: [
                ContactNames.cD7,
                ContactNames.cD6,
                ContactNames.cD5,
                ContactNames.cD4,
                ContactNames.cD3,
                ContactNames.cD2,
                ContactNames.cD1,
                ContactNames.cD0,
              ],
            ),
            ...createContactsWithShift(
              shift: 17,
              startOffset: const Offset(372, 338),
              listContactsName: [
                ContactNames.cA0,
                ContactNames.cA1,
                ContactNames.cA2,
                ContactNames.cA3,
                ContactNames.cA4,
                ContactNames.cA5,
              ],
            ),
            ...createContactsWithShift(
              shift: 17,
              startOffset: const Offset(217, 338),
              listContactsName: [
                null,
                null,
                null,
                ContactNames.c3_3V,
                ContactNames.c5V,
                ContactNames.cGND,
                ContactNames.cGND,
                ContactNames.cVIN,
              ],
            ),
          ],
        ) {
    if (allowedContactsList.isNotEmpty && forbidenContactsList.isNotEmpty) {
      throw AssertionError("Error");
    }

    for (ContactData c in contacts) {
      c.mayUse = (allowedContactsList.isNotEmpty)
          ? allowedContactsList.contains(c.nameContact)
          : !forbidenContactsList.contains(c.nameContact);

      c.device = this;
    }
  }
}
