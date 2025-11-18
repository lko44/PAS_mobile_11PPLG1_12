import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_12/controller/navbar_controller.dart';

class NavbarPage extends StatelessWidget {
  NavbarPage({super.key});
  final navbarC = Get.find<NavbarController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Obx(() {
        return navbarC.mobilePages[navbarC.selectedIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: navbarC.selectedIndex.value,
          onTap: (index) => navbarC.changeTab(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Produk',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Bookmark',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        );
      }),
    );
  }
}
