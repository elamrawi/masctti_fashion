import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/PrimaryButton.dart';
import 'package:masctti_fashion/components/auth/AuthLayout.dart';
import 'package:masctti_fashion/components/auth/PrimaryTextField.dart';
import 'package:masctti_fashion/components/auth/TitleAuth.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final GlobalKey keyForm = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return AuthLayout(keyForm: keyForm, children: [
      const TitleAuth(
          title: 'هل نسيت كلمة المرور', subTitle: "لا تقلق بشأن هذا"),
      PrimaryTextField(
          label: 'البريد الالكتروني الخاص بحسابك',
          hintText: "البريد الالكتروني",
          validator: (val) => null),
      PrimaryButton(
          text: 'ارسال كود الاستعادة',
          onPressed: () {
            Get.offNamed('password-recovery');
          }),
    ]);
  }
}
