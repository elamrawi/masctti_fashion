import 'package:flutter/material.dart';
import 'package:masctti_fashion/components/ListProducts.dart';
import 'package:masctti_fashion/components/TitleSection.dart';
import 'package:masctti_fashion/components/category/SubCategories.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SubCategories(),
        TitleSection(title: "الجاكيتات", showAll: () {}),
        ListProducts(),
        ListProducts(),
        ListProducts(),
      ]),
    );
  }
}
