import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_12/controller/productList_controller.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});
  final controller = Get.find<ProductListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List'), centerTitle: true),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.productList.isEmpty) {
          return const Center(child: Text('No products available.'));
        }

        return RefreshIndicator(
          onRefresh: () {
            return controller.fetchProducts();
          },
          child: ListView.builder(
            itemCount: controller.productList.length,
            itemBuilder: (context, index) {
              final product = controller.productList[index];
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
                    icon: Icon(
                      product.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: product.isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      controller.toggleFavorite(product);
                    },
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}