import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/models/Product.dart';
import 'package:masctti_fashion/models/Review.dart';
import 'package:masctti_fashion/server/api.dart';

class SingleProductController extends GetxController {
  var size;
  int quantity = 0;
  TextEditingController quantityController = TextEditingController(text: "1");
  Product? product;
  List reviews = [];
  bool isloading = false;
  @override
  void onInit() async {
    isloading = true;
    update();
    product = await Api.getProduct(Get.arguments['product_id']);
    reviews = await Api.getReviews(Get.arguments['product_id']);
    reviews =
        reviews.where((review) => review['status'] == 'approved').toList();
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
}
