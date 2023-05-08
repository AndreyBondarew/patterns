
void main(List<String> arguments) async {
  UserInfo user = UserInfo('admin@admin.com', 'qwerty');
  Service service = Service();
  ChainItemContract checkUser = ChainFirstItem();
  checkUser.addAllCheckItem([
    CheckEmail(), CheckUser()
  ]);
  print(service.login(user, checkUser));
}

abstract class ChainItemContract{
  ChainItemContract? nextItem;

  ChainItemContract({this.nextItem});

  bool check(UserInfo user, Map<String, String> availableUser);

  bool checkNext(UserInfo user, Map<String, String> availableUser){
    if(nextItem == null){
      return true;
    } else {
      return nextItem!.check(user, availableUser);
    }
  }

  void addNextCheckItem(ChainItemContract nextItem){
    this.nextItem = nextItem;
  }

  void addAllCheckItem(List<ChainItemContract> items){
    ChainItemContract currentItem = this;
    for (var element in items) {
      currentItem.addNextCheckItem(element);
      currentItem = element;
    }
  }
}

class ChainFirstItem extends ChainItemContract{
  @override
  bool check(UserInfo user, Map<String, String> availableUser) {
    return checkNext(user, availableUser);
  }

}

class UserInfo{
  final String email;
  final String password;

  UserInfo(this.email, this.password);

}

class CheckUser extends ChainItemContract{
  CheckUser({super.nextItem});
  @override
  bool check(UserInfo user, Map<String, String> availableUser) {
    print('check user');
    if(availableUser[user.email] == user.password){
      return checkNext(user, availableUser);
    }
    return false;
  }

}

class CheckEmail extends ChainItemContract{
  CheckEmail({super.nextItem});

  @override
  bool check(UserInfo user, Map<String, String> availableUser) {
    print('check email');
    if(availableUser.containsKey(user.email)){
      return checkNext(user, availableUser);
    }
    return false;
  }

}

class Service{
  Map<String, String> registeredUser = {
    'admin@admin.com':'qwerty',
    'user@user.com':'123'
  };

  bool login(UserInfo user, ChainItemContract validateChain){
    return validateChain.check(user, registeredUser);
  }
}