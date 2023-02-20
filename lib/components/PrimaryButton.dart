import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool isFullWidth;
  final onPressed;
  const PrimaryButton(
      {required this.text, required this.onPressed, this.isFullWidth = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 12, right: 16, left: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(top: 4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          fixedSize:
              isFullWidth ? Size(MediaQuery.of(context).size.width, 48) : null,
        ),
      ),
    );
  }
}
