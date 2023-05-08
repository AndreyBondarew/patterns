void main(List<String> arguments) {
  ValidatorCompound validator = ValidatorCompound();
  validator.add(StringNotNull());
  validator.add(StringNotEmpty());
  validator.add(StringIsEmail());
  validator.validate('nu@ll');
  print(validator.isValid);
}

abstract class BaseValidator<T> {
  bool _isValid = false;
  void validate(T? data);

  bool get isValid => _isValid;
}

class StringNotNull extends BaseValidator<String> {
  @override
  void validate(String? data) {
    _isValid = data != null;
  }

}

class StringNotEmpty extends BaseValidator<String> {
  @override
  void validate(String? data) {
    _isValid = data != null && data.isNotEmpty;
  }
  
}

class StringIsEmail extends BaseValidator<String>{
  @override
  void validate(String? data) {
    _isValid = data != null && data.contains('@');
  }

}

class ValidatorCompound extends BaseValidator<dynamic> {
  final List<BaseValidator> _item = [];

  void add(BaseValidator validator) {
    _item.add(validator);
  }

  @override
  void validate(data) {
    for (var element in _item) {
      element.validate(data);
    }
  }

  @override
  bool get isValid {
    return !_item.any((element) => !element.isValid);
  }
}
