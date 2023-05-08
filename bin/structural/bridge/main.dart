
void main(List<String> arguments) {
  Triangle triangle = Triangle(RedColor());
  Circle circle = Circle(BlueColor());
  triangle.draw();
  circle.draw();
}

abstract class Shape{
  FillColor _fillColor;

  Shape(this._fillColor);

  void draw();
}

class Triangle extends Shape{
  Triangle(super.fillColor);


  @override
  void draw() {
    print('draw ${_fillColor.fillColor()} triangle');
  }

}

class Circle extends Shape{
  Circle(super.fillColor);

  @override
  void draw() {
    print('draw ${_fillColor.fillColor()} circle');
  }

}

abstract class FillColor{
  String fillColor();
}

class RedColor implements FillColor{
  @override
  String fillColor() {
    return 'red';
  }

}

class BlueColor implements FillColor{
  @override
  String fillColor() {
    return 'blue';
  }
}