import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/GridProducts.dart';
import 'package:masctti_fashion/components/LoadingScreen.dart';
import 'package:masctti_fashion/controllers/profile/FavoriteController.dart';
import 'package:masctti_fashion/models/Product.dart';
import 'package:masctti_fashion/components/LayoutSinglePage.dart';
import 'package:masctti_fashion/server/UserInfo.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutSinglePage(title: "المفضلة", children: [
      GetBuilder<FavoriteController>(
          init: FavoriteController(),
          builder: (controller) => controller.isloading
              ? Center(child: CircularProgressIndicator())
              : GridProducts(controller.products))
    ]);
  }
}
