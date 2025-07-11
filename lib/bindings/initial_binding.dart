import 'package:get/get.dart';

class InitialBinding extends Bindings{

  @override
  void dependencies() {
    //Get.lazyPut(() => ApiCrud(), fenix: true);
   // Get.lazyPut(() => NetworkManager(), fenix: true);
  }
}