import 'package:flutter/material.dart';
import 'package:masctti_fashion/components/ListProducts.dart';
import 'package:masctti_fashion/components/Product.dart';
import 'package:masctti_fashion/components/profile/ProfileLayout.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileLayout(title: "المفضلة", children: [
      ListProducts(),
      ListProducts(),
      ListProducts(),
      ListProducts(),
    ]);
  }
}
