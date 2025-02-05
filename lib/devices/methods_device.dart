import 'package:ArduinoSimulator/data/contact_data.dart';
import 'package:flutter/material.dart';

List<ContactData> createContactsWithShift({
    required double shift,
    Axis axis = Axis.horizontal,
    Offset startOffset = const Offset(0, 0),
    List<String?> listContactsName = const [],
  }) {
    List<ContactData> contacts = [];
    int i = 0;

    for (String? c in listContactsName) {
      i++;
      if (c == null) continue;

      contacts.add(ContactData(
          nameContact: c,
          offset: Offset(
            startOffset.dx + ((axis == Axis.horizontal) ? (i - 1) * shift : 0),
            startOffset.dy + ((axis == Axis.vertical) ? (i - 1) * shift : 0),
          )));
    }

    return contacts;
  }