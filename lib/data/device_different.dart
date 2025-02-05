class DeviceDifferent {
  int using = 0;
  int notUsing = 0;

  int get total => using + notUsing;

  @override
  String toString() => "Use: $using/$total";
}