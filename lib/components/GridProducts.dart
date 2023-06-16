import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/Product.dart';
import 'package:masctti_fashion/controllers/LayoutController.dart';
import '../models/Product.dart' as model;

class GridProducts extends StatelessWidget {
  final List<model.Product> products;
  final controller;
  GridProducts(this.products, {super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: NotificationListener<ScrollEndNotification>(
        onNotification: (n) {
          if (n.metrics.pixels > 0) {
            if (controller != null)
              controller.scrollEnd(products[0].categories![0].id!);
          }
          return true;
        },
        child: Stack(children: [
          GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 16,
                crossAxisSpacing: 10,
                maxCrossAxisExtent: 165,
                childAspectRatio: 0.58,
              ),
              padding: EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 60),
              children: [
                ...products
                    .map<Widget>((model.Product product) => Product(
                          product,
                          name: product.name!,
                          evaluation: double.parse(product.averageRating!),
                          price: product.price!,
                          urlImage: product.images![0].src!,
                        ))
                    .toList(),
              ]),
          if (controller != null)
            if (controller.loadingOtherProduct && !controller.finallyProduct)
              Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(),
              )
        ]),
      ),
    );
  }
}
