class NegativePositionException implements Exception {
  /// `NegativePositionException` is thrown when the position (x or y) is less than 0
  
  NegativePositionException();

  @override
  String toString() => "Position can't be negative number";
}