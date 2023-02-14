import 'package:flutter/material.dart';

class TitleAuth extends StatelessWidget {
  final String title, subTitle;

  const TitleAuth({
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Column(children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xff282828)),
        ),
        SizedBox(
          height: 10,
        ),
        Text(subTitle,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff31394D).withOpacity(0.6),
            ))
      ]),
    );
  }
}
