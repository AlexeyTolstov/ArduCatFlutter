import 'package:ArduinoSimulator/data/identifications/point_id.dart';
import 'package:ArduinoSimulator/data/mixins/position.dart';

class PointPosition with Position {
  late final PointId id;

  @override
  String toString() => "$x $y";

  void setPos(double x, double y) {
    this.x = x;
    this.y = y;
  }

  PointPosition(double x, double y, [PointId? pointId]) {
    this.x = x;
    this.y = y;
    id = pointId ?? PointId();
  }
}