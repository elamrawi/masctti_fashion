import 'package:flutter/material.dart';
import 'package:masctti_fashion/components/category/ButtonParentCate.dart';

class ParentCategories extends StatelessWidget {
  final categories = ['الملابس', "الأحذية", "الاكسسوارات"];
  ParentCategories({super.key});

  @override
  Widget build(BuildContext context) {
    // return ListView.separated(
    //   separatorBuilder: (_, _) => SizedBox(width: 10),
    //   itemCount: 3,
    //   scrollDirection: Axis.horizontal,
    //   itemBuilder: (_, index) =>
    //       ElevatedButton(onPressed: () {}, child: Text(categories)),
    //   OutlinedButton(onPressed: () {}, child: Text("الأحذية")),
    //   OutlinedButton(onPressed: () {}, child: Text("الاكسسوارات")),
    // );
    return Container(
      height: 40,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        children: [
          ButtonParentCate(
            text: 'الملابس',
            onPressed: () {},
            active: true,
          ),
          SizedBox(width: 10),
          ButtonParentCate(
            text: 'الأحذية',
            onPressed: () {},
          ),
          SizedBox(width: 10),
          ButtonParentCate(
            text: 'الاكسسوارات',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
