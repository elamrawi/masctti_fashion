import 'package:flutter/material.dart';

class TitleSectionProduct extends StatelessWidget {
  final String text;
  final bool isMargin;
  const TitleSectionProduct(this.text, {super.key, this.isMargin = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isMargin ? EdgeInsets.only(top: 16) : EdgeInsets.zero,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
      ),
    );
  }
}
