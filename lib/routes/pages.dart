import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_12/bindings/favProductList_binding.dart';
import 'package:pas_mobile_11pplg1_12/bindings/login_binding.dart';
import 'package:pas_mobile_11pplg1_12/bindings/navbar_binding.dart';
import 'package:pas_mobile_11pplg1_12/bindings/productList_binding.dart';
import 'package:pas_mobile_11pplg1_12/bindings/register_binding.dart';
import 'package:pas_mobile_11pplg1_12/bindings/splashscreen_binding.dart';
import 'package:pas_mobile_11pplg1_12/pages/favProductList_page.dart';
import 'package:pas_mobile_11pplg1_12/pages/login_page.dart';
import 'package:pas_mobile_11pplg1_12/pages/navbar_page.dart';
import 'package:pas_mobile_11pplg1_12/pages/productList_page.dart';
import 'package:pas_mobile_11pplg1_12/pages/profile_page.dart';
import 'package:pas_mobile_11pplg1_12/pages/register_page.dart';
import 'package:pas_mobile_11pplg1_12/pages/splashscreen_page.dart';
import 'package:pas_mobile_11pplg1_12/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splashscreen,
      page: () => SplashscreenPage(),
      binding: SplashscreenBinding(),
    ),

    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    
    GetPage(
      name: Routes.profile,
      page: () => ProfilePage(),
      binding: LoginBinding(),
    ),
    
    GetPage(
      name: Routes.productList,
      page: () => ProductlistPage(),
      binding: ProductlistBinding(),
    ),

    GetPage(
      name: Routes.navbar,
      page: () => NavbarPage(),
      bindings: [NavbarBinding(), ProductlistBinding(),LoginBinding(),FavproductlistBinding()]
    ),

    GetPage(
      name: Routes.favProductList,
      page: () => FavproductlistPage(),
      binding: FavproductlistBinding(),
    ),

    GetPage(
      name: Routes.register,
      page: () => RegisterPage(),
      binding: RegisterBinding (),
    ),
  ];
}
