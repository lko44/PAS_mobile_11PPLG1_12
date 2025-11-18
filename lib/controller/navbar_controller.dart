import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_12/pages/favProductList_page.dart';
import 'package:pas_mobile_11pplg1_12/pages/productList_page.dart';
import 'package:pas_mobile_11pplg1_12/pages/profile_page.dart';

class NavbarController extends GetxController {
  RxInt selectedIndex = 0.obs;
    final mobilePages = [

    ProductListPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
