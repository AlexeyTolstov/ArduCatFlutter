mixin class Position {
  double x = 0;
  double y = 0;
  
  static Position pos(double x, double y)
    => Position()
      ..x = x
      ..y = y;
}