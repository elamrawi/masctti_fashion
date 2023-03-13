import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/category/ButtonSubCate.dart';
import 'package:masctti_fashion/controllers/LayoutController.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(builder: (controller) {
      if (controller.subCategroies == []) return Container();
      return Container(
        height: 50,
        child: ListView.separated(
          itemBuilder: (_, i) => ButtonSubCate(
            text: controller.subCategroies[i].name.toString(),
            onPressed: () =>
                controller.selectSubCategory(controller.subCategroies[i]),
            active: true,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, i) => const SizedBox(width: 10),
          itemCount: controller.subCategroies.length,
        ),
      );
    });
  }
}
