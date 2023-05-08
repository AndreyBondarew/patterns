
void main(List<String> arguments) {
  String test = 'test';
  StorageContract storage = Storage();
  storage.write(test);
  print(storage.read());

  StorageContract storage2 = ConvertToHtml(Storage());
  storage2.write(test);
  print(storage2.read());
}

abstract class StorageContract{
  void write (String s);

  String read();
}

class Storage implements StorageContract{
  String _storage = '';

  @override
  void write(String s){
    _storage = s;
    print ('BaseStorage => write $s');
  }

  @override
  String read(){
    print('BaseStorage => read. Return $_storage');
    return _storage;
  }
}

class BaseDecorator implements StorageContract{
  final StorageContract _storage;

  BaseDecorator(this._storage);

  @override
  String read() {
    return _storage.read();
  }

  @override
  void write(String s) {
    _storage.write(s);
  }

}

class ConvertToHtml extends BaseDecorator{
  ConvertToHtml(super.storage);

  @override
  void write(String s){
    s = '<html> $s </html>';
    super.write(s);
  }

  @override
  String read() {
    String s = super.read();
    s = s.replaceAll('<html>', '');
    s = s.replaceAll('</html>', '');
    s = s.trim();
    return s;
  }
}