import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionForgotPassword extends StatelessWidget {
  const QuestionForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          Get.toNamed('forgot-password');
        },
        child: Text(
          'هل نسيت كلمة المرور ؟',
          style: TextStyle(color: Color(0xff838894), fontSize: 16),
        ),
      ),
    );
  }
}
