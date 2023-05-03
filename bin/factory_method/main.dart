void main(List<String> arguments) {
  List<ShapeCreator> creators = [TriangleCreator(), CircleCreator()];
  for (var element in creators) {
    Shape shape = element.create();
    print(shape.runtimeType);
  }
}

abstract class Shape{}

class Triangle implements Shape{

}

class Circle implements Shape{

}

abstract class ShapeCreator{
  Shape create();
}

class TriangleCreator implements ShapeCreator{
  @override
  Shape create() {
    return Triangle();
  }
}

class CircleCreator implements ShapeCreator{
  @override
  Shape create() {
    return Circle();
  }
}