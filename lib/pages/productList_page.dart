import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_12/controller/favProductList_controller.dart';
import 'package:pas_mobile_11pplg1_12/controller/productList_controller.dart';
import 'package:pas_mobile_11pplg1_12/widgets/custom_card.dart';
import 'package:pas_mobile_11pplg1_12/widgets/custom_loading.dart';
import 'package:pas_mobile_11pplg1_12/widgets/custom_text.dart';

class ProductlistPage extends StatelessWidget {
  ProductlistPage({super.key});
  final controller = Get.find<ProductListController>();
  final favController = Get.find<FavoritesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          "Store List",
          size: 20,
          weight: FontWeight.bold,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) return const CustomLoading();

        if (controller.productList.isEmpty) {
          return const Center(
            child: CustomText(
              "Tidak ada data ditemukan.",
              size: 16,
              color: Colors.black54,
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async => controller.fetchProducts(),
          child: ListView.builder(
            itemCount: controller.productList.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              final store = controller.productList[index];

              return Obx(() {
                return CustomCard(
                  imageUrl: store.image,
                  title: store.title,
                  subtitle:
                      "Price: ${store.price} | Category: ${store.category}",
                  isFavorite: favController.isFavorite(store.toJson()),
                  onFavorite: () {
                    favController.toggleFavorite(store.toJson());
                  },
                );
              });
            },
          ),
        );
      }),
    );
  }
}
