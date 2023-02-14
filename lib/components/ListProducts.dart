import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:masctti_fashion/components/Product.dart';

class ListProducts extends StatelessWidget {
  const ListProducts();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 166,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Product(),
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(
          width: 12,
        ),
      ),
    );
  }
}
