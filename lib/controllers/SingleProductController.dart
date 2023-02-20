import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SingleProductController extends GetxController {
  var size;
  int quantity = 0;
  TextEditingController quantityController = TextEditingController(text: "1");
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
