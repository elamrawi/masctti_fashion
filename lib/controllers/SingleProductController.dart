import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/models/Product.dart';
import 'package:masctti_fashion/server/UserInfo.dart';
import 'package:masctti_fashion/server/api.dart';

class SingleProductController extends GetxController {
  String? size;
  int quantity = 1;
  TextEditingController quantityController = TextEditingController(text: "1");
  Product? product;
  List reviews = [];
  bool isloading = true;
  bool isFavorite = false;
  @override
  void onInit() async {
    product = Get.arguments['product'];
    reviews = await Api.getReviews(product!.id!);

    reviews =
        reviews.where((review) => review['status'] == 'approved').toList();
    // if (UserInfo.box.hasData('favoriteProduct'))
    //   isFavorite = UserInfo.box
    //       .read('favoriteProduct')
    //       .any((favorite) => int.parse(favorite.id) == product!.id);
    isloading = false;
    update();
    super.onInit();
  }

  void changeSize(val) {
    size = val;
    update();
  }

  void plusQuantity() {
    quantity++;
    quantityController.text = quantity.toString();
    update();
  }

  void minusQuantity() {
    if (quantity > 1) {
      quantity--;
      quantityController.text = quantity.toString();
      update();
    }
  }

  void toggleFavorite() {
    isFavorite
        ? UserInfo.removeFavorite(Get.arguments['product'])
        : UserInfo.addFavorite(Get.arguments['product']);
    isFavorite = !isFavorite;
    update();
  }
}
