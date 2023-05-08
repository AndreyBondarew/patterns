
void main(List<String> arguments) {
  FlyweightFactory flyweightFactory = FlyweightFactory();

  FlyweightContract flyweight = flyweightFactory.getFlyweight("SharedState");
  flyweight.operation();

  flyweight = flyweightFactory.getFlyweight("SharedState");
  flyweight.operation();

  flyweight = flyweightFactory.getFlyweight("AnotherSharedState");
  flyweight.operation();
}


abstract class FlyweightContract {
  void operation();
}

class FlyweightObject implements FlyweightContract {
  final String _sharedState;

  FlyweightObject(this._sharedState);

  @override
  void operation() {
    print("Flyweight object: $_sharedState hash: $hashCode");
  }
  
}

class FlyweightFactory {
  final Map<String, FlyweightContract> _flyweights = <String, FlyweightContract>{};

  FlyweightContract getFlyweight(String key) {
    if (!_flyweights.containsKey(key)) {
      _flyweights[key] = FlyweightObject(key);
    }
    return _flyweights[key]!;
  }
}