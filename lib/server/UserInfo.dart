import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:masctti_fashion/models/Product.dart';

import '../models/Customer.dart';

class UserInfo {
  static final box = GetStorage();
  static int get id => box.read('id');

  static String get name {
    if (box.hasData('first_name') && box.hasData('last_name'))
      return "${box.read('first_name')} ${box.read('last_name')}";
    else if (box.hasData('first_name'))
      return "${box.read('first_name')}";
    else if (box.hasData('last_name')) return "${box.read('last_name')}";
    return "";
  }

  static List<Product> get favorites {
    if (box.hasData('favoriteProduct')) return [];
    return box.read('favoriteProduct');
  }

  static String get location {
    if (box.hasData('city') && box.hasData('country'))
      return "${box.read('city')} , ${box.read('country')}";
    else if (box.hasData('city'))
      return "${box.read('city')}";
    else if (box.hasData('country')) return "${box.read('country')}";
    return "";
  }

  static String get phone {
    if (box.hasData('phone')) return box.read('phone');
    return '';
  }

  static String get avatar => box.read('avatar');

  static setAllData(Customer data) {
    box.write('id', data.id);
    box.write('username', data.username);
    box.write('email', data.email);
    box.write('first_name', data.firstName);
    box.write('last_name', data.lastName);
    box.write('phone', data.billing!.phone);
    box.write('avatar', data.avatarUrl);
    box.write('city', data.billing!.city);
    box.write('country', data.billing!.country);
  }

  static setPersonalInfo(Customer data) {
    box.write('email', data.email);
    box.write('first_name', data.firstName);
    box.write('last_name', data.lastName);
    box.write('phone', data.billing!.phone);
    box.write('city', data.billing!.city);
    box.write('country', data.billing!.country);
    // box.write('avatar', data.avatarUrl);
  }

  static Future<bool> isLogin() async {
    return false;
  }

  static getAllData() {}
  static clearData() async {
    await box.remove('id');
    await box.remove('username');
    await box.remove('email');
    await box.remove('first_name');
    await box.remove('last_name');
    await box.remove('phone');
    await box.remove('avatar');
    await box.remove('city');
    await box.remove('country');
    await box.remove('city');
    await box.remove('country');
  }

  static addOrder(order) {}
  static setImageAvatar(imageUrl) {}
  static setPayment({fullname, dateLast, code, location, typePayment}) {}
  static addFavorite(product) {
    List<int> favoriteProduct = [];
    if (box.hasData('favoriteProduct'))
      favoriteProduct = box.read('favoriteProduct');
    favoriteProduct.add(product.id);
    box.write('favoriteProduct', favoriteProduct);
  }

  static removeFavorite(product) {
    List<int> favoriteProduct = [];
    if (box.hasData('favoriteProduct'))
      favoriteProduct = box.read('favoriteProduct');
    favoriteProduct.remove(product.id);
    box.write('favoriteProduct', favoriteProduct);
    // List<Product> favoriteProduct = box.read('favoriteProduct') ?? [];
    // favoriteProduct.remove(product);
    // box.write('favoriteProduct', favoriteProduct);
  }

  static addSearchHistory(text) {
    if (box.hasData('search_history')) {
      List searchHistory = box.read('search_history');
      if (searchHistory.contains(text)) {
        searchHistory.remove(text);
        searchHistory.add(text);
      } else {
        if (searchHistory.length >= 20) {
          searchHistory.removeAt(0);
          searchHistory.add(text);
        } else
          searchHistory.addIf(searchHistory.length < 20, text);
      }
      box.write('search_history', searchHistory);
    } else
      box.write('search_history', [text]);
  }
}
