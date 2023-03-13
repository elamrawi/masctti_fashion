import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final showAll;
  const TitleSection({required this.title,  this.showAll});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16, left: 16, top: 16),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff282828))),
        if (showAll != null)
          InkWell(
            onTap: showAll,
            child: Text('عرض الكل',
                style: TextStyle(
                    color: Color(0xff838894),
                    fontSize: 10,
                    fontWeight: FontWeight.w500)),
          )
      ]),
    );
  }
}
