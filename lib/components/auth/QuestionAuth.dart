import 'package:flutter/material.dart';

class QuestionAuth extends StatelessWidget {
  final String text, textLink;
  final onTap;
  const QuestionAuth(
      {required this.text, required this.textLink, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(fontSize: 16, color: Color(0xff838894))),
          InkWell(
            child: Text(textLink,
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffBF3027),
                    fontWeight: FontWeight.bold)),
            onTap: onTap,
          )
        ],
      ),
    );
  }
}
