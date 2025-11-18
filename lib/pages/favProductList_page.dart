import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_12/controller/favProductList_controller.dart';
import 'package:pas_mobile_11pplg1_12/widgets/custom_card.dart';
import 'package:pas_mobile_11pplg1_12/widgets/custom_text.dart';

class FavproductlistPage extends StatelessWidget {
  FavproductlistPage({super.key});

    final favController = Get.find<FavoritesController>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          "Favorite List",
          size: 20,
          weight: FontWeight.bold,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (favController.favorites.isEmpty) {
          return const Center(
            child: CustomText("No favorite products found."),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: favController.favorites.length,
          itemBuilder: (context, index) {
            final store = favController.favorites[index];

            return CustomCard(
              imageUrl: store["image"],
              title: store["title"],
              subtitle: "Price: ${store["price"]} | Category: ${store["category"]}",
              isFavorite: true,
              onFavorite: () => favController.toggleFavorite(store),
            );
          },
        );
      }),
    );
  }
}