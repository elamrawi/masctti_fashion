import 'package:get/get.dart';
import 'package:masctti_fashion/server/UserInfo.dart';
import 'package:masctti_fashion/server/api.dart';

import '../../models/Product.dart';

class FavoriteController extends GetxController {
  List<int>? ids = [];
  List<Product> products = [];
  bool isloading = true;
  @override
  void onInit() async {
    ids = UserInfo.box.read('favoriteProduct');
    products = await Api.getProductsId(ids!);
    isloading = false;
    update();
    super.onInit();
  }
}
