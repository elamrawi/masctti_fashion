import 'package:flutter/material.dart';

class ProductEvaluation extends StatelessWidget {
  final double size, evaluation;
  const ProductEvaluation(this.evaluation, {this.size = 7});
  List<Widget> get getstars {
    List<Widget> stars = [];
    int eval = evaluation.toInt();
    bool ishalf = false;
    for (int i = 1; i <= 5; i++) {
      if (i <= eval)
        stars.add(Icon(
          Icons.star,
          color: Color(0xffFFA800),
          size: size,
        ));
      else {
        if (evaluation.round() > eval && !ishalf) {
          stars.add(Icon(
            Icons.star_half,
            color: Color(0xffFFA800),
            size: size,
          ));
          ishalf = true;
        } else
          stars.add(Icon(
            Icons.star,
            color: Color(0xff838894),
            size: size,
          ));
      }
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
