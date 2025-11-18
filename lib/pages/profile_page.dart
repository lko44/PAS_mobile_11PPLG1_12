import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_12/controller/login_controller.dart';
import 'package:pas_mobile_11pplg1_12/widgets/custom_button.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto Profil
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/image/mantap.png"), 
                // ganti sesuai asset kamu
              ),
            ),
            const SizedBox(height: 16),

            // Nama User
            const Text(
              "Enriko Raina Patasa",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Email User
            const Text(
              "enrikoraina@gmail.com",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Card Info
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.school, color: Colors.blueAccent),
                title: const Text("Kelas 11 PPLG 1"),
                subtitle: const Text("Nomor Absen: 12"),
              ),
            ),
            const SizedBox(height: 16),

            // Tombol Logout
            CustomButton(
              text: "Logout",
              textcolor: Colors.red,
              onPressed: () {
                controller.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}