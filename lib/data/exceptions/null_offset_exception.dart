class NullOffsetException implements Exception {
  /// `NullOffsetException` is thrown when no offset is specified on one of the axes (offset is null)
  
  NullOffsetException();

  @override
  String toString() => "Offset can't be nullable value";
}