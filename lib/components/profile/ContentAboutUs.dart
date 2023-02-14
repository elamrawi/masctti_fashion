import 'package:flutter/material.dart';

class ContentAboutUs extends StatelessWidget {
  final String text;
  const ContentAboutUs(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(text,
          style: TextStyle(
              fontSize: 16, color: Color(0xff31394D).withOpacity(.6))),
    );
  }
}
