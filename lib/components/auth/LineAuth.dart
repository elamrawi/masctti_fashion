import 'package:flutter/material.dart';

class LineAuth extends StatelessWidget {
  final String text;
  const LineAuth(this.text);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Divider(
          indent: 16,
          endIndent: 16,
          color: Color(0xff838894),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(8),
          color: Colors.white,
          child: Text(text,
              style: TextStyle(
                color: Color(0xff838894),
                fontSize: 16,
              )),
        )
      ],
    );
  }
}
