import 'shapes/circle.dart';
import 'shapes/triangle.dart';

void main(List<String> arguments) {
  Circle circle = Circle(5, 7, 15);
  Circle clone = circle.cloneShape();
  print('$circle id ${circle.hashCode}');
  print('$clone id ${clone.hashCode}');

  Triangle triangle = Triangle(5, 7, 15, 15, 21,20);
  Triangle cloneTriangle = triangle.cloneShape();
  print('$triangle id ${triangle.hashCode}');
  print('$cloneTriangle id ${cloneTriangle.hashCode}');
}