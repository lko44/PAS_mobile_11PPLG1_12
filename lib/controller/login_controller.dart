import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_12/models/clientnetwork.dart';
import 'package:pas_mobile_11pplg1_12/models/loginAPI_model.dart';
import 'package:pas_mobile_11pplg1_12/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;

  Future<void> loginapi() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Username and password required',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      isLoading.value = true;

      final response = await ClientNetwork.postData("login", {
        'username': username,
        'password': password,
      });

      debugPrint('login status: ${response.statusCode}');
      debugPrint('login body: ${response.body}');

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final data = loginApiFromJson(response.body);

        if (data.status == true && data.token.isNotEmpty) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString("username", username);
          await prefs.setString("token", data.token);

          Get.snackbar(
            'Success',
            data.message,
            snackPosition: SnackPosition.BOTTOM,
          );
          Get.offNamed(Routes.navbar);
        } else {
          Get.snackbar(
            'Login failed',
            data.message,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } else {
        Get.snackbar(
          'Server error',
          'Status code: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      debugPrint('login error: $e');
      Get.snackbar(
        'Error',
        'Username or password wrong',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false; // stop loading
    }
  }

  // 🔹 LOGOUT
  Future<void> logout() async {
    Get.defaultDialog(
      title: "Konfirmasi",
      middleText: "Apakah kamu yakin ingin Log out? :(",
      textCancel: "NO",
      textConfirm: "Yes",
      confirmTextColor: Colors.white,
      onConfirm: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.clear();

        // ✅ Kembali ke login
        Get.offAllNamed(Routes.login);

        Get.snackbar(
          "Logout",
          "Anda telah logout",
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }

}
