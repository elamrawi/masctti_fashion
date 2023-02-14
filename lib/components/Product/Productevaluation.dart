import 'package:flutter/material.dart';

class Productevaluation extends StatelessWidget {
  final int evaluation;
  const Productevaluation(this.evaluation);
  List<Widget> get getstars {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      if (i <= evaluation)
        stars.add(Icon(
          Icons.star,
          color: Color(0xffFFA800),
          size: 7,
        ));
      else
        stars.add(Icon(
          Icons.star,
          color: Color(0xff838894),
          size: 7,
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
