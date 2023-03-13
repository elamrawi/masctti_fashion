import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/PrimaryButton.dart';
import 'package:masctti_fashion/components/auth/AuthLayout.dart';
import 'package:masctti_fashion/components/auth/PrimaryTextField.dart';
import 'package:masctti_fashion/components/auth/TitleAuth.dart';

import '../../components/auth/PasswordTextField.dart';

class NewPassword extends StatelessWidget {
  var keyForm = GlobalKey();

  NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(keyForm: keyForm, children: [
      TitleAuth(
          title: "انشاء كلمة مرور جديدة",
          subTitle: "الآن يمكنك انشاء كلمة مرور جديدة"),
      PasswordTextField(
        controllerTextField: TextEditingController(),
        label: 'كلمة المرور الجديدة',
        hintText: "",
        validator: (val) => null,
      ),
      PasswordTextField(
        controllerTextField: TextEditingController(),
        label: 'تأكيد كلمة المرور',
        hintText: "",
        validator: (val) => null,
        isNew: true,
      ),
      PrimaryButton(
          text: "تأكيد كلمة المرور",
          onPressed: () {
            Get.offAllNamed('/login');
          })
    ]);
  }
}
