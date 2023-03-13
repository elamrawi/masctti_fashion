import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/GridProducts.dart';
import 'package:masctti_fashion/components/LoadingScreen.dart';
import 'package:masctti_fashion/components/TitleSection.dart';
import 'package:masctti_fashion/components/category/SubCategories.dart';
import 'package:masctti_fashion/controllers/LayoutController.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    print('build category');
    return SingleChildScrollView(
      child: Column(children: [
        SubCategories(),
        GetBuilder<LayoutController>(
            builder: (controller) =>
                TitleSection(title: controller.titleCategory)),
        GetBuilder<LayoutController>(
            init: LayoutController(),
            builder: (controller) {
              if (controller.isloadCate)
                return Container(
                  height: MediaQuery.of(context).size.height - 200,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              if (controller.isloadCate == false &&
                  controller.categoryProducts == [])
                return Container(
                  height: MediaQuery.of(context).size.height - 200,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Text('لا يوجد منتجات في هذا التصنيف'),
                );

              return GridProducts(controller.categoryProducts!);
            }),
      ]),
    );
  }
}
