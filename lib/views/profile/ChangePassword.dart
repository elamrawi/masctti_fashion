import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/LoadingScreen.dart';
import 'package:masctti_fashion/components/PrimaryButton.dart';
import 'package:masctti_fashion/components/auth/PrimaryTextField.dart';
import 'package:masctti_fashion/components/auth/QuestionAuth.dart';
import 'package:masctti_fashion/components/auth/QuestionForgotPassword.dart';
import 'package:masctti_fashion/components/LayoutSinglePage.dart';

import '../../components/auth/PasswordTextField.dart';
import '../../controllers/profile/ChangePasswordController.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
      init: ChangePasswordController(),
      builder: (controller) => controller.isload
          ? LoadingScreen()
          : LayoutSinglePage(
              title: "تغيير كلمة المرور",
              keyForm: controller.keyForm,
              children: [
                PasswordTextField(
                  controllerTextField: controller.password,
                  label: 'كلمة المرور الحالية',
                  hintText: "",
                  validator: (val) =>
                      val == '' ? 'يجب ملأ حقل كلمة المرور' : null,
                 
                ),
                PasswordTextField(
                  controllerTextField: controller.newPassword,
                  label: 'كلمة المرور الجديدة',
                  hintText: "",
                  validator: (val) =>
                      val == '' ? 'يجب ملأ حقل كلمة المرور' : null,
                  isNew: true,
                ),
                PrimaryButton(
                    text: "تأكيد كلمة المرور",
                    onPressed: controller.changePassword),
                const QuestionForgotPassword()
              ],
            ),
    );
  }
}
