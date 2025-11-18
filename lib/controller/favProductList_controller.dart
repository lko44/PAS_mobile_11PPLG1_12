import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_12/helpers/db_helper.dart';

class FavoritesController extends GetxController {
  var favorites = <Map<String, dynamic>>[].obs;
  final _db = FavoriteDB();

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final data = await _db.getFavorites();

    favorites.assignAll(
      List<Map<String, dynamic>>.from(data),
    );
  }

  bool isFavorite(Map<String, dynamic> item) {
    return favorites.any((fav) => fav["id"] == item["id"]);
  }

  Future<void> toggleFavorite(Map<String, dynamic> item) async {
    final id = item["id"];

    if (isFavorite(item)) {
      /// Hapus dari DB
      await _db.deleteFavorite(id);

      /// Hapus dari RxList
      favorites.removeWhere((fav) => fav["id"] == id);
    } else {
      /// Buat Map baru
      final newItem = {
        "id": id,
        "title": item["title"],
        "price": item["price"],
        "category": item["category"],
        "image": item["image"],
      };

      /// Tambah ke DB
      await _db.addFavorite(newItem);

      /// Tambah ke RxList
      favorites.add(newItem);
    }
  }
}
