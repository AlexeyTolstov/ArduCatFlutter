int _deviceId = 0;

class DeviceId {
  final int id = _deviceId++;

  DeviceId();

  @override
  String toString() => "Device ID: $id";

  @override
  bool operator ==(Object other)
    => other is DeviceId && id == other.id;

  @override
  int get hashCode => id.hashCode;
}