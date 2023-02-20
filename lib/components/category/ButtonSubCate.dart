import 'package:flutter/material.dart';

class ButtonSubCate extends StatelessWidget {
  final String text;
  final onPressed;
   bool active;
   ButtonSubCate({
    super.key,
    required this.text,
    required this.onPressed,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          minimumSize: const Size(106, 35),
          side: BorderSide(
              color:
                  active ? Theme.of(context).primaryColor : Color(0xffE8E9EA),
              width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Text(
          text,
          style: TextStyle(
              color:
                  active ? Theme.of(context).primaryColor : Color(0xff282828),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
