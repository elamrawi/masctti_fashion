import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final onTap;
  const ProfileItem(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: ListTile(
        dense: true,
        onTap: onTap,
        contentPadding: EdgeInsets.all(0),
        title: Text(
          text,
          style: TextStyle(
              color: Color(0xff282828),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        leading: Container(
          child: Icon(icon),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: Color(0xffE8E9EA),
              )),
        ),
      ),
    );
  }
}
