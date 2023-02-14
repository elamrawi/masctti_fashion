import 'package:flutter/material.dart';

class TitleAboutUs extends StatelessWidget {
  final String text;
  const TitleAboutUs(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 16,left: 16,right: 16),
      child: Text(text,
          style: TextStyle(
              color: Color(0xff282828),
              fontWeight: FontWeight.w500,
              fontSize: 14)),
    );
  }
}
