import 'package:flutter/material.dart';
import 'package:masctti_fashion/components/category/ButtonSubCate.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        scrollDirection: Axis.horizontal,
        children: [
          ButtonSubCate(
            text: "الملابس",
            onPressed: () {},
            active: true,
          ),
          SizedBox(width: 10),
          ButtonSubCate(text: "البلايز", onPressed: () {}),
          SizedBox(width: 10),
          ButtonSubCate(text: "البلاطين", onPressed: () {}),
        ],
      ),
    );
  }
}
