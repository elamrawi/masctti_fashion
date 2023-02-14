import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/PrimaryButton.dart';
import 'package:masctti_fashion/components/auth/PrimaryTextField.dart';
import 'package:masctti_fashion/components/auth/QuestionAuth.dart';
import 'package:masctti_fashion/components/auth/QuestionForgotPassword.dart';
import 'package:masctti_fashion/components/profile/ProfileLayout.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileLayout(title: "تغيير كلمة المرور", children: [
      PrimaryTextField(
        label: 'كلمة المرور الحالية',
        hintText: "",
        validator: (val) => null,
        isPass: true,
      ),
      PrimaryTextField(
        label: 'كلمة المرور الجديدة',
        hintText: "",
        validator: (val) => null,
        isPass: true,
      ),
      PrimaryButton(
          text: "تأكيد كلمة المرور",
          onPressed: () {
            Get.offNamed('/profile');
          }),
      QuestionForgotPassword()
    ]);
  }
}
