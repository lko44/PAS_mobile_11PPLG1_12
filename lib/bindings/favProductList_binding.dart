import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_12/controller/favProductList_controller.dart';

class FavproductlistBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<FavproductlistController>(()=>FavproductlistController());
  }
}