import 'shape_contract.dart';

class Triangle extends Shape{
  final double x2, y2, x3, y3;

  Triangle(super.x, super.y, this.x2, this.y2, this.x3, this.y3);

  @override
  Triangle cloneShape() {
    return Triangle(x,y, x2, y2, x3, y3);
  }

  String toString() => 'p1($x,$y), p2($x2,$y2), p3($x3, $y3)';
}