import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_12/controller/navbar_controller.dart';

class NavbarBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(()=>NavbarController());
  }
}