import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/ListProducts.dart';
import 'package:masctti_fashion/components/placeholders/ListProductsPlaceHolder.dart';
import 'package:masctti_fashion/controllers/LayoutController.dart';

import '../components/TitleSection.dart';
import '../components/home/Ad.dart';

class Home extends StatelessWidget {
  Home({super.key});
  @override
  Widget build(BuildContext context) {
    print('build home');
    return GetBuilder<LayoutController>(
        init: LayoutController(),
        builder: (controller) {
          // if (controller.isConnectInternet == false)
          //   return Center(
          //     child: Text("No internet", style: TextStyle(fontSize: 18)),
          //   );
          return SingleChildScrollView(
            child: Column(children: [
              Ad(),
              // قم بتجربتها
              if ((controller.isLoad || controller.dailyProducts.isNotEmpty))
                Column(
                  children: [
                    TitleSection(
                      title: 'العروض اليومية',
                    ),
                    ListProducts(controller.dailyProducts),
                  ],
                ),
              if ((controller.isLoad ||
                  controller.moreRequesetedProducts.isNotEmpty))
                Column(
                  children: [
                    TitleSection(
                      title: 'المنتجات الاكثر طلباً',
                    ),
                    ListProducts(controller.moreRequesetedProducts),
                  ],
                ),
              if ((controller.isLoad || controller.recentlyProducts.isNotEmpty))
                Column(
                  children: [
                    TitleSection(
                      title: 'المضافة مؤخراً',
                    ),
                    ListProducts(controller.recentlyProducts),
                  ],
                ),

              // if (controller.isConnectInternet)
              // GetBuilder<LayoutController>(
              //     init: LayoutController(),
              //     builder: (controller) {
              //       if (controller.isLoad == false &&
              //           controller.dailyProducts == []) {
              //         return Container();
              //       }
              //       return Column(
              //         children: [
              //           TitleSection(
              //             title: 'المنتجات الاكثر طلباً',
              //           ),
              //           ListProducts(controller.moreRequesetedProducts),
              //         ],
              //       );
              //     }),
              // if (controller.isConnectInternet)
              //   GetBuilder<LayoutController>(
              //       init: LayoutController(),
              //       builder: (controller) {
              //         if (controller.isLoad == false &&
              //             controller.dailyProducts == []) {
              //           return Container();
              //         }
              //         return Column(
              //           children: [
              //             TitleSection(
              //               title: 'المضافة مؤخراً',
              //             ),
              //             ListProducts(controller.recentlyProducts),
              //           ],
              //         );
              //       }),

              SizedBox(
                height: 10,
              )
            ]),
          );
        });
  }
}
