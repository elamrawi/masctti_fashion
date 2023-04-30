import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/ListProducts.dart';
import 'package:masctti_fashion/components/LoadingScreen.dart';
import 'package:masctti_fashion/components/placeholders/ListProductsPlaceHolder.dart';
import 'package:masctti_fashion/controllers/LayoutController.dart';

import '../components/NoInternet.dart';
import '../components/TitleSection.dart';
import '../components/home/Ad.dart';

class Home extends StatelessWidget {
  Home({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
        init: LayoutController(),
        builder: (controller) {
          if (!controller.isConnectInternet)
            return NoInternet(
              reload: controller.reloadProductsHome,
            );
          return SingleChildScrollView(
            child: Column(children: [
              Ad(),
              // if ((controller.isLoad || controller.dailyProducts.isNotEmpty))
              //   Column(
              //     children: [
              //       TitleSection(
              //         title: 'العروض اليومية',
              //       ),
              //       ListProducts(controller.dailyProducts),
              //     ],
              //   ),
              // if ((controller.isLoad ||
              //     controller.moreRequesetedProducts.isNotEmpty))
              //   Column(
              //     children: [
              //       TitleSection(
              //         title: 'المنتجات الاكثر طلباً',
              //       ),
              //       ListProducts(controller.moreRequesetedProducts),
              //     ],
              //   ),
              if (controller.isConnectInternet)
                Column(
                  children: [
                    TitleSection(
                      title: 'المضافة مؤخراً',
                    ),
                    ListProducts(controller.recentlyProducts),
                  ],
                ),
              const SizedBox(
                height: 10,
              )
            ]),
          );
        });
  }
}
