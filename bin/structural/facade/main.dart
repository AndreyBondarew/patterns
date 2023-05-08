
void main(List<String> arguments) {
  LightFacade myFacade = LightFacade();
  myFacade.addOrder('order');
}

class VeryLargeApi{

  void addDocument(dynamic doc){
    print('add doc');
  }

  void addTransaction(dynamic doc, dynamic transaction){
    print('add transaction');
  }

  void addReversal(dynamic transaction){
    print('add reversal');
  }

  void setAccount(dynamic account){
    print('add account');
  }

  void commit(){
    print('commit');
  }
  //........................
}

class LightFacade{
  VeryLargeApi largeApi = VeryLargeApi();

  void addOrder(dynamic order){
    largeApi.addDocument('order');
    largeApi.addTransaction('order', 'transaction');
    largeApi.commit();
  }

  void removeOrder(dynamic order){
    largeApi.addReversal('transaction');
    largeApi.commit();
  }
}