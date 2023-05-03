import 'shape_contract.dart';

class Circle extends Shape {
  double radius;

  Circle(double x, double y, this.radius) : super(x,y);

  @override
  Circle cloneShape() {
    return Circle(x, y, radius);
  }

  @override
  String toString() => 'X: $x, Y: $y, R: $radius';
}