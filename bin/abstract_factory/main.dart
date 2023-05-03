void main(List<String> arguments) {
  ShapeFactory factory = BlueFactory();
  print(factory.createTriangle().runtimeType);
}

abstract class Triangle{}
abstract class Square{}

class BlueTriangle implements Triangle{

}

class BlueSquare implements Square{

}

class RedTriangle implements Triangle{

}

class RedSquare implements Square{

}

abstract class ShapeFactory{
  Triangle createTriangle();
  Square createSquare();
}

class BlueFactory implements ShapeFactory{
  @override
  Square createSquare() {
    return BlueSquare();
  }

  @override
  Triangle createTriangle() {
    return BlueTriangle();
  }

}

class RedFactory implements ShapeFactory{
  @override
  Square createSquare() {
    return RedSquare();
  }

  @override
  Triangle createTriangle() {
    return RedTriangle();
  }

}