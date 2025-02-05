import 'dart:math';

import 'package:ArduinoSimulator/data/contact_data.dart';
import 'package:ArduinoSimulator/data/mixins/point_position.dart';
import 'package:ArduinoSimulator/data/mixins/position.dart';

class Wire {
  final ContactData firstContact;
  final ContactData lastContact;
  List<PointPosition> listPoints = [];

  static double lenght(Position p1, Position p2)
    => sqrt(pow(p2.x - p1.x, 2) + pow(p2.y - p1.y, 2));

  static double angle(Position p1, Position p2)
    => atan2(p2.y - p1.y, p2.x - p1.x);

  void updatePoints() {
    listPoints.first = firstContact.point;
    listPoints.last = lastContact.point;
  }

  Wire(this.firstContact, this.lastContact) {
    listPoints.addAll([firstContact.point, lastContact.point]);
  }
}