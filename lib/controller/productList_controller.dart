import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_12/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductListController extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductList>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      const url = 'https://fakestoreapi.com/products';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        productList.value = productListFromJson(response.body);
      } else {
        Get.snackbar('Error', 'Failed to fetch products');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

    void toggleFavorite(ProductList product) {
    final index = productList.indexOf(product);
    if (index != -1) {
      productList[index].isFavorite = !productList[index].isFavorite;
      productList.refresh(); // Notify listeners
    }
  }

  List<ProductList> get favoriteProducts =>
      productList.where((product) => product.isFavorite).toList();
}
