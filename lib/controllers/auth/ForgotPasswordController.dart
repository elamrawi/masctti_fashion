import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/server/api.dart';

// convert ForgotPasswordController to ResetPasswordController
// and one controller to more classes reset password
class ForgotPasswordController extends GetxController {
  bool isload = false;
  TextEditingController email = TextEditingController();
  final GlobalKey<FormState> keyForm = GlobalKey();

  void sendCode() async {
    if (keyForm.currentState!.validate()) {
      isload = true;
      update();
      // content sendCode
      try {
        await Api.sendCode(email.text);
        Get.toNamed('password-recovery', arguments: {'email': email.text});
      } catch (e) {
        Get.defaultDialog(
            textCancel: 'حسناً',
            onCancel: () {
              Get.back();
            },
            radius: 6,
            titlePadding: EdgeInsets.only(top: 20),
            title: "حدث خطأ ما.",
            content: Text(
              "يجب التأكد من أن البريد الالكتروني مسجل من قبل أو تأكد من الاتصال بالانترنت .",
              style: TextStyle(color: Color(0xff838894)),
            ));
      }
      isload = false;
      update();
    }
  }
}
