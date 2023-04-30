import 'package:get/get.dart';
import 'package:masctti_fashion/models/Product.dart';

import '../server/api.dart';

class SearchProductsController extends GetxController {
  List<Product> products = [];
  bool isloading = true;
  @override
  void onInit() async {
    products = await Api.getSearchProducts(Get.arguments['resultSearch']);
    isloading = false;
    update();
    super.onInit();
  }

  void goToSearch() {
    Get.back();
    Get.offNamed('search');
  }
}
