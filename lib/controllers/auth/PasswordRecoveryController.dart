import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/server/api.dart';

class PasswordRecoveryController extends GetxController {
  String code = '';
  bool isload = false;
  final GlobalKey<FormState> keyForm = GlobalKey();
  validateCode() {
    if (keyForm.currentState!.validate()) {
      keyForm.currentState!.save();
      print('code $code');
      isload = true;
      update();
      try {
        Api.validateCode(email: Get.arguments['email'], code: code);
        Get.offNamed('/new-password');
      } catch (e) {
        Get.defaultDialog(
            textCancel: 'حسناً',
            onCancel: () {
              Get.back();
            },
            radius: 6,
            titlePadding: EdgeInsets.only(top: 20),
            title: "الكود غير صحيح.",
            content: Text(
              "قم بإعادة إدخال الكود وتأكد منه.",
              style: TextStyle(color: Color(0xff838894)),
            ));
      }
      isload = false;
      update();
    }
  }

  saveNumber(val) {
    code += val;
  }
}
