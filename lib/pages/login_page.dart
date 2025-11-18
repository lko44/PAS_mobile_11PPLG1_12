import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_12/controller/login_controller.dart';
import 'package:pas_mobile_11pplg1_12/routes/routes.dart';
import 'package:pas_mobile_11pplg1_12/widgets/custom_button.dart';
import 'package:pas_mobile_11pplg1_12/widgets/custom_textField.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                "Welcome Back 👋",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Login to continue using the app",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 40),

              // Username
              MyTextField(
                textEditingController: controller.usernameController,
                label: "Username",
              ),
              const SizedBox(height: 16),

              // Password
              MyTextField(
                textEditingController: controller.passwordController,
                label: "Password",
                isObscured: true,
              ),
              const SizedBox(height: 30),

              // Login Button
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    text: controller.isLoading.value ? "Loading..." : "Login",
                    textcolor: Colors.white,
                    isLoading: controller.isLoading.value,
                    onPressed: controller.loginapi,
                  ),
                ),
              ),

              const SizedBox(height: 24),
 
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    text: controller.isLoading.value ? "Loading..." : "Register",
                    textcolor: Colors.white,
                    isLoading: controller.isLoading.value,
                    onPressed: (){
                      Get.toNamed(Routes.register);
                    },
                  ),
                ),
              ),
              // Footer text
              // Center(
              //   child: TextButton(
              //     onPressed: () {
              //       Get.snackbar(
              //         'Nihahahaha',
              //         'Kasihan deh loh lupa passwordnya :V',
              //         snackPosition: SnackPosition.BOTTOM,
              //       );
              //     },
              //     child: const Text(
              //       "Forgot Password?",
              //       style: TextStyle(
              //         color: Colors.blueAccent,
              //         fontSize: 15,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
