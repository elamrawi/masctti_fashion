import 'package:flutter/material.dart';

class ShowPrice extends StatelessWidget {
  final String title;
  final String price;
  const ShowPrice({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 10),
      padding: EdgeInsets.only(left: 11, right: 9),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.1),
              offset: Offset(0, 4),
              blurRadius: 4)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Color(0xff838894),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          Text("$price ريال سعودي",
              style: TextStyle(
                  color: Color(0xff282828),
                  fontSize: 14,
                  fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}
