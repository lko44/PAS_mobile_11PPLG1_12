import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_12/controller/productList_controller.dart';

class ProductlistBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProductListController>(()=>ProductListController());
  }
}