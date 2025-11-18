import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_12/controller/splashscreen_controller.dart';
import 'package:pas_mobile_11pplg1_12/widgets/custom_text.dart';


class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});
  final controller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo atau ikon bulat
              const SizedBox(height: 40),

              // Animasi loading
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              const SizedBox(height: 100),

              // Teks loading
              CustomText.heading('Loading...'),
            ],
          ),
        ),
      ),
    );
  }
}