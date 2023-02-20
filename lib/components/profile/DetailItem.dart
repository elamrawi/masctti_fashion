import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailItem extends StatelessWidget {
  final String text;
  const DetailItem(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Image.asset(
            'assets/images/icon_detail.png',
            height: 7,
          ),
          SizedBox(
            width: 8,
          ),
          Text(text,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff838894)))
        ],
      ),
    );
  }
}
