import 'package:flutter/material.dart';
import 'package:masctti_fashion/components/ListProducts.dart';
import 'package:masctti_fashion/components/Product.dart';
import 'package:masctti_fashion/components/LayoutSinglePage.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutSinglePage(title: "المفضلة", children: [
      ListProducts(),
      ListProducts(),
      ListProducts(),
      ListProducts(),
    ]);
  }
}
