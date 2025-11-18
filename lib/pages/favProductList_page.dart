import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_12/controller/productList_controller.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  final controller = Get.find<ProductListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites'), centerTitle: true),
      body: Obx(() {
        final favorites = controller.favoriteProducts;

        if (favorites.isEmpty) {
          return const Center(child: Text('No favorite products.'));
        }

        return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final product = favorites[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.network(
                  product.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(product.title),
                subtitle: Text(
                  'Price: \$${product.price.toStringAsFixed(2)}\nCategory: ${product.category}',
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    controller.toggleFavorite(product);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}