import 'package:flutter/material.dart';

class ButtonSocial extends StatelessWidget {
  final String type, text;
  const ButtonSocial({required this.type, required this.text});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          maximumSize: Size(167, 44),
          minimumSize: Size(162, 44), // 167 , 44
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xffE8E9EA)),
              borderRadius: BorderRadius.circular(6)),
          // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          padding: const EdgeInsets.all(0),
        ),
        icon: Image.asset(
          'assets/images/$type.png',
          height: 20,
          width: 20,
        ),
        onPressed: () {},
        label: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Text(
            text,
            style: TextStyle(color: Color(0xff282828), fontSize: 16),
          ),
        ),
      ),
    );
  }
}
