import 'package:flutter/material.dart';

class Payments extends StatelessWidget {
  final List<Widget> children;
  final String title;
  Payments({required this.children, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 16,
      ),
      alignment: Alignment.centerRight,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff282828)),
          ),
        ),
        Container(
            height: 87,
            margin: EdgeInsets.only(top: 16),
            child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: children))
      ]),
    );
  }
}
