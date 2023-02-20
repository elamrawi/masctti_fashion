import 'package:flutter/material.dart';

class ButtonParentCate extends StatelessWidget {
  final String text;
  final onPressed;
  final bool active;
  const ButtonParentCate(
      {super.key,
      required this.text,
      required this.onPressed,
      this.active = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(
                    color: active ? Colors.transparent : Color(0xffE8E9EA),
                    width: 1)),
            minimumSize: const Size(106, 40),
            foregroundColor: active ? Colors.white : Color(0xff282828),
            backgroundColor:
                active ? Theme.of(context).primaryColor : Colors.white),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            text,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
