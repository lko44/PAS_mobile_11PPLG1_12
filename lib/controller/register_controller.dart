import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_12/models/registerAPI_model.dart';
import 'package:pas_mobile_11pplg1_12/routes/routes.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Future<void> register() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();


    if (username.isEmpty || password.isEmpty || fullName.isEmpty || email.isEmpty) {
      Get.snackbar('Error', 'All fields are required');
      return;
    }

    try {
      isLoading(true);
      const url = 'https://mediadwi.com/api/latihan/register-user';
      final response = await http.post(
        Uri.parse(url),
        body: {
          'username': username,
          'password': password,
          'full_name': fullName,
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        final registerResponse = registerApiFromJson(response.body);

        if (registerResponse.status) {
          Get.snackbar('Success', registerResponse.message);
          Get.offAllNamed(Routes.login);
        } else {
          if (registerResponse.message.contains('already exists')) {
            Get.snackbar(
              'Error',
              'User already exists. Please try a different username or email.',
            );
          } else {
            Get.snackbar('Error', registerResponse.message);
          }
        }
      } else {
        Get.snackbar('Error', 'Registration failed. Please try again.');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}