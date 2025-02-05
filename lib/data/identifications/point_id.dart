int _pointId = 0;

class PointId {
  final int id = _pointId++;

  PointId();

  @override
  String toString() => "Point ID: $id";

  @override
  bool operator ==(Object other)
    => other is PointId && id == other.id;

  @override
  int get hashCode => id.hashCode;
}