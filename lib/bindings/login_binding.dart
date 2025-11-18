import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_12/controller/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(()=>LoginController());
  }
}