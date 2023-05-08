import 'dart:math';

void main(List<String> arguments) {
  MyAdapter adapter = MyAdapter();
  print(adapter.nextInt(100));
  MyAdapter2 adapter2 = MyAdapter2();
  print(adapter2.nextInt(100));
}

class ExtendsLib{
  double generateNextNumber(double from, double to){
    double num = Random().nextDouble();
    num = num * (to-from) + from;
    return num;
  }
}

class MyGenerator{
  int nextInt(int range){
    return Random().nextInt(range);
  }
}
// ---------------- v1 ---------------------
class MyAdapter implements MyGenerator{
  final ExtendsLib extendsLib = ExtendsLib();

  @override
  int nextInt(int range) {
    double res = extendsLib.generateNextNumber(0, range.toDouble());
    return res.toInt();
  }
}

// ---------------- v2 ---------------------
class MyAdapter2 extends ExtendsLib implements MyGenerator{
  @override
  int nextInt(int range) {
    double res = generateNextNumber(0, range.toDouble());
    return res.toInt();
  }

}