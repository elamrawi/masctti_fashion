import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/category/ButtonParentCate.dart';
import 'package:masctti_fashion/controllers/LayoutController.dart';

class ParentCategories extends StatelessWidget {
  ParentCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: GetBuilder<LayoutController>(builder: (controller) {
        return ListView.separated(
            separatorBuilder: (_, i) => const SizedBox(
                  width: 10,
                ),
            itemCount: controller.parentCategories.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, i) => ButtonParentCate(
                  text: controller.parentCategories[i].name.toString(),
                  onPressed: () =>
                      controller.showSubCategory(controller.parentCategories[i].id),
                  active: true,
                ));
      }),
    );
  }
}
// ...[ButtonParentCate(
//             text: 'الملابس',
//             onPressed: () {},
//             active: true,
//           ),
//           SizedBox(width: 10)]