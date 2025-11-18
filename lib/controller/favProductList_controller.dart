import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavproductlistController extends GetxController {
  var bookmarks = [].obs;

  Future<void> addBookmark(Map<String, dynamic> product) async {
    final prefs = await SharedPreferences.getInstance();
    final savedBookmarks = prefs.getStringList('bookmarks') ?? [];

    savedBookmarks.add(json.encode(product));
    await prefs.setStringList('bookmarks', savedBookmarks);

    bookmarks.value = savedBookmarks.map((e) => json.decode(e)).toList();
  }

  Future<void> removeBookmark(Map<String, dynamic> product) async {
    final prefs = await SharedPreferences.getInstance();
    final savedBookmarks = prefs.getStringList('bookmarks') ?? [];

    savedBookmarks.remove(json.encode(product));
    await prefs.setStringList('bookmarks', savedBookmarks);

    bookmarks.value = savedBookmarks.map((e) => json.decode(e)).toList();
  }

  Future<void> loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final savedBookmarks = prefs.getStringList('bookmarks') ?? [];

    bookmarks.value = savedBookmarks.map((e) => json.decode(e)).toList();
  }
}