import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_12/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
@override
void onInit() {
  super.onInit();
  Future.delayed(const Duration(seconds: 2), () {
    checkLoginStatus();
  });
}

Future<void> checkLoginStatus() async {
  await Future.delayed(const Duration(milliseconds: 800));

  final prefs = await SharedPreferences.getInstance();

  final token = prefs.getString("token"); // login biasa

  if (token != null && token.isNotEmpty) {
    print('Auto login (Mantap) with token: $token');
    Get.offAllNamed(Routes.navbar);
    return;
  }

  Get.offAllNamed(Routes.login);
}

}
