import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/GridProducts.dart';
import 'package:masctti_fashion/controllers/SearchProductsController.dart';

import '../components/SearchTextField.dart';

class SearchProducts extends StatelessWidget {
  SearchProducts({super.key});
  final SearchProductsController controller =
      Get.put(SearchProductsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xff282828),
        shadowColor: Colors.transparent,
        title: SearchTextField(
          readOnly: true,
          controllerTextField:
              TextEditingController(text: Get.arguments['resultSearch']),
          onTap: controller.goToSearch,
        ),
      ),
      body: GetBuilder<SearchProductsController>(
          builder: (controller) => controller.isloading
              ? Center(child: CircularProgressIndicator())
              : controller.products.isEmpty
                  ? Center(
                      child: Text('لا يوجد منتجات'),
                    )
                  : GridProducts(
                      controller.products,
                    )),
    );
  }
}
