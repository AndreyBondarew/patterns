abstract class Prototype {
  String _commonField;

  Prototype(this._commonField);

  String get commonField => _commonField;

  Prototype clone() {
    var clone = _clone();
    clone._commonField = _commonField;
    return clone;
  }

  Prototype _clone();
}

class ConcretePrototype1 extends Prototype {
  String _name;

  ConcretePrototype1(String commonField, this._name) : super(commonField);

  @override
  Prototype _clone() {
    return ConcretePrototype1(commonField, _name);
  }

  String get name => _name;
}

class ConcretePrototype2 extends Prototype {
  int _value;

  ConcretePrototype2(String commonField, this._value) : super(commonField);

  @override
  Prototype _clone() {
    return ConcretePrototype2(commonField, _value);
  }

  int get value => _value;
}

void main() {
  var commonField = 'Common Field';
  var prototype1 = ConcretePrototype1(commonField, 'Prototype 1');
  var prototype2 = ConcretePrototype2(commonField, 10);

  var clone1 = prototype1.clone();
  var clone2 = prototype2.clone();

  print('Clone 1 common field: ${clone1.commonField}, name: {clone1.name}');
  print('Clone 2 common field: ${clone2.commonField}, value: {clone2.value}');
}