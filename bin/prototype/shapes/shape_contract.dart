abstract class Shape{
  final double _x, _y;

  Shape(this._x, this._y);

  double get x => _x;
  double get y => _y;

  Shape cloneShape();

}