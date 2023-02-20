import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final String text;
  const SearchItem(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
