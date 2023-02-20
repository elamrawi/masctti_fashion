import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  final String title;
  const TitlePage(this.title,{super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        
        style: TextStyle(
            color: Color(0xff282828), fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
