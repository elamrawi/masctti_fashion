import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final String text;
  final onTap;
   SearchItem(this.text, {super.key,this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      title: Text(text,
          style: TextStyle(
              color: Color(0xff282828),
              fontSize: 14,
              fontWeight: FontWeight.w500)),
    );
  }
}
