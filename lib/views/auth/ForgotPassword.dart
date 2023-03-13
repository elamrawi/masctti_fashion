import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/PrimaryButton.dart';
import 'package:masctti_fashion/components/auth/AuthLayout.dart';
import 'package:masctti_fashion/components/auth/PrimaryTextField.dart';
import 'package:masctti_fashion/components/auth/TitleAuth.dart';
import 'package:masctti_fashion/controllers/auth/ForgotPasswordController.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
        init: ForgotPasswordController(),
        builder: (controller) {
          if (controller.isload)
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          return AuthLayout(keyForm: controller.keyForm, children: [
            const TitleAuth(
                title: 'هل نسيت كلمة المرور', subTitle: "لا تقلق بشأن هذا"),
            PrimaryTextField(
              controllerTextField: controller.email,
              keyboardType: TextInputType.emailAddress,
              label: 'البريد الالكتروني الخاص بحسابك',
              hintText: "البريد الالكتروني",
              validator: (String? val) {
                if (val == '') return 'يجب ملأ حقل بريد الالكتروني.';
                if (!val!.isEmail) return 'يجب ان يكون بريد الكتروني.';
              },
            ),
            PrimaryButton(
                text: 'ارسال كود الاستعادة', onPressed: controller.sendCode),
          ]);
        });
  }
}
