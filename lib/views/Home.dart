import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/ListProducts.dart';

import '../components/TitleSection.dart';
import '../components/home/Ad.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    print(Get.width);
    return SingleChildScrollView(
      child: Column(children: [
        Ad(),
        TitleSection(title: 'العروض اليومية', showAll: () {}),
        ListProducts(),
        TitleSection(title: 'المنتجات الاكثر طلباً', showAll: () {}),
        ListProducts(),
        TitleSection(title: 'المضافة مؤخراً', showAll: () {}),
        ListProducts(),
        SizedBox(
          height: 10,
        )
      ]),
    );
  }
}
