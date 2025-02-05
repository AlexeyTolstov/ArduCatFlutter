int _lineId = 0;

class LineId {
  final int id = _lineId++;

  LineId();

  @override
  String toString() => "Line ID: $id";

  @override
  bool operator ==(Object other)
    => other is LineId && id == other.id;

  @override
  int get hashCode => id.hashCode;
}