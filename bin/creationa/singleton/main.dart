void main(List<String> arguments) {
  MySingleton mySingleton1 = MySingleton();
  MySingleton mySingleton2 = MySingleton();
  print(mySingleton1.hashCode);
  print(mySingleton2.hashCode);

  MySingleton2 mySingleton12 = MySingleton2.getInstance();
  MySingleton2 mySingleton22 = MySingleton2.getInstance();
  print(mySingleton12.hashCode);
  print(mySingleton22.hashCode);
}

class MySingleton{
  static MySingleton? _instance;
  MySingleton._();

  factory MySingleton(){
    _instance ??= MySingleton._();
    return _instance!;
  }
}

class MySingleton2{
  static MySingleton2? _instance;
  MySingleton2._();
  static MySingleton2 getInstance(){
    _instance ??= MySingleton2._();
    return _instance!;
  }
}