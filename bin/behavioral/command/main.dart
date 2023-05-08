import 'dart:io';

void main(List<String> arguments) {
  String? response = '';
  Dispatcher dispatcher = Dispatcher();
  while (response?.toLowerCase() != 'exit'){
    print('enter command(I/U/D) or "exit" ');
    response = stdin.readLineSync();
    BaseCommandContract? command = dispatcher.dispatchCommand(response??'');
    if (command != null){
      print('enter data');
      command.execute(data: stdin.readLineSync());
    }
  }
}
abstract class BaseCommandContract{
  bool execute({dynamic data});
}
class UpdateCommand implements BaseCommandContract{
  @override
  bool execute({dynamic data}) {
    print ('update data $data');
    return true;
  }

}

class DeleteCommand implements BaseCommandContract{
  @override
  bool execute({data}) {
    print('delete command $data');
    return true;
  }

}

class InsertCommand implements BaseCommandContract{
  @override
  bool execute({data}) {
    print('insert data $data');
    return true;
  }

}

class Dispatcher {
  BaseCommandContract? dispatchCommand(String commandName){
    commandName = commandName.toLowerCase();
    switch (commandName){
      case('i'):{
        return InsertCommand();
      }
      case('d'):{
        return DeleteCommand();
      }
      case('u'):{
        return UpdateCommand();
      }
    }
    return null;
  }
}