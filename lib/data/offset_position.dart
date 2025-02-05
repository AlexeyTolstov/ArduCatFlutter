import 'package:ArduinoSimulator/data/exceptions/null_offset_exception.dart';

class OffsetPosition {
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;

  OffsetPosition({
    this.left,
    this.right,
    this.top,
    this.bottom}) {
      if ((left ?? right) == null) throw NullOffsetException();
      if ((top ?? bottom) == null) throw NullOffsetException();
    }
}