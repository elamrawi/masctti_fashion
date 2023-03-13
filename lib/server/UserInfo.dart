import 'package:get_storage/get_storage.dart';

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
    box.write('city', data.shipping!.city);
    box.write('country', data.shipping!.country);
  }

  static setPersonalInfo(Customer data) {
    box.write('email', data.email);
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
    return await box.erase();
  }

  static addOrder(order) {}
  static setImageAvatar(imageUrl) {}
  static setPayment({fullname, dateLast, code, location, typePayment}) {}
  static addFavorite(product) {}
}
