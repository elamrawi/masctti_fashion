import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/server/UserInfo.dart';

class SearchController extends GetxController {
  List searchHistory = [];
  List resultsSearch = [];
  TextEditingController resultSearch = TextEditingController();

  @override
  void onInit() {
    searchHistory = UserInfo.box.read('search_history') ?? [];
    resultsSearch = searchHistory;
    super.onInit();
  }

  void onSearch(text) {
    UserInfo.addSearchHistory(text);
    Get.toNamed('search-products',
        arguments: {'resultSearch': resultSearch.text});
  }

  void onChangeSearch(String text) {
    resultsSearch = searchHistory
        .where((recordSearch) => recordSearch.contains(text.trim()))
        .toList();
    update();
  }

  void removeSearchHistory() {
    UserInfo.box.remove('search_history');
    searchHistory = [];
    update();
  }

  void selectSearchItem(recordSearch) {
    UserInfo.addSearchHistory(recordSearch);
    Get.toNamed('search-products', arguments: {'resultSearch': recordSearch});
  }
}
