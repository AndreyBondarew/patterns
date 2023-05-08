
import 'dart:async';
import 'dart:math';

void main(List<String> arguments) async {
  /*AnythingLargeLibContract lib = AnythingLargeLib();
  Map res = await lib.getData();
  NetworkData data = await lib.getDataFromId('id');
  print('finish!');*/
  NetworkDataCashProxy dataCashProxy = NetworkDataCashProxy();
  print('=============== first start');
  await dataCashProxy.getData();
  print('--------------- from id...');
  await dataCashProxy.getDataFromId('some_id');
  print('=============== second start');
  await dataCashProxy.getData();
  print('--------------- from id...');
  await dataCashProxy.getDataFromId('some_id');
}

class NetworkDataCashProxy implements AnythingLargeLibContract{
  Map<String, NetworkData> cache = {};
  late final AnythingLargeLibContract largeLib;

  NetworkDataCashProxy(){
    largeLib = AnythingLargeLib();
  }
  @override
  Future<Map<String, NetworkData>> getData() async {
    if (cache.isEmpty){
      cache.addAll(await largeLib.getData());
    } else {
      print('get from cache');
    }
    return cache;
  }

  @override
  Future<NetworkData> getDataFromId(String id) async {
    NetworkData? res = cache[id];
    if (res == null){
      res = await largeLib.getDataFromId(id);
      cache[res.id] = res;
    } else {
      print('get from cache');
    }
    return res;
  }

}


abstract class AnythingLargeLibContract{
  Future<Map<String, NetworkData>> getData();

  Future<NetworkData> getDataFromId(String id);
}

class AnythingLargeLib implements AnythingLargeLibContract{
  @override
  Future<Map<String, NetworkData>> getData() async{
    await connect();
    print('get data list...');
    await networkLatency();
    print('complete!');
    return{'aaaaaaa':NetworkData('aaaaaaa','aaaaaaa','aaaaaaa_data'),
      'aaaaaab':NetworkData('aaaaaab','aaaaaab','aaaaaab_data'),
      'aaaaaac':NetworkData('aaaaaac','aaaaaac','aaaaaac_data'),
      'aaaaaad':NetworkData('aaaaaad','aaaaaad','aaaaaad_data'),};
  }

  @override
  Future<NetworkData> getDataFromId(String id) async{
    print('get some data...');
    await networkLatency();
    print('complete!');
    return NetworkData(id, "some", 'some_data');
  }

  FutureOr<void> connect() async{
    print('Fake connect to server...');
    await networkLatency();
    print('connected!');
  }

  FutureOr<void> networkLatency() async {
    return Future.delayed(Duration(seconds: Random().nextInt(7)+1));
  }
}

class NetworkData{
  final String id;
  final String name;
  final dynamic data;

  NetworkData(this.id, this.name, this.data);
}