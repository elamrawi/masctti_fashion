import 'package:flutter/material.dart';

class ProductEvaluation extends StatelessWidget {
  final int evaluation;
  final double size;
  const ProductEvaluation(this.evaluation, {this.size = 7});
  List<Widget> get getstars {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      if (i <= evaluation)
        stars.add(Icon(
          Icons.star,
          color: Color(0xffFFA800),
          size: size,
        ));
      else
        stars.add(Icon(
          Icons.star,
          color: Color(0xff838894),
          size: size,
        ));
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: getstars,
    );
  }
}
