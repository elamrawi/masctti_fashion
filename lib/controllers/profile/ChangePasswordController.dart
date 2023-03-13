import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/server/UserInfo.dart';
import 'package:masctti_fashion/server/api.dart';

class ChangePasswordController extends GetxController {
  bool isload = false;
  final TextEditingController password = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final GlobalKey<FormState> keyForm = GlobalKey();
  void changePassword() async {
    if (keyForm.currentState!.validate()) {
      isload = true;
      update();
      try {
        Map result = await Api.changePassword(UserInfo.id,
            password: password.text, newPassword: newPassword.text);
        await Get.defaultDialog(
            textCancel: 'حسناً',
            radius: 6,
            titlePadding: EdgeInsets.only(top: 20),
            title: result['code'] == 200 ? "تمت العملية بنجاح" : "حدث خطأ",
            content: Text(
              result['msg'],
              style: TextStyle(color: Color(0xff838894)),
            ));
        if (result['code'] == 200)
          Get.offAllNamed('/login');
        else {
          password.clear();
          newPassword.clear();
        }
      } catch (e) {
        await Get.defaultDialog(
            textCancel: 'حسناً',
            onCancel: () {
              // if (result['code'] == 200) Get.offAllNamed('/login');
            },
            radius: 6,
            titlePadding: EdgeInsets.only(top: 20),
            title: "خطأ في الخادم",
            content: Text(
              'الخادم طور الصيانة حاول مرة اخرى بعد دقائق',
              style: TextStyle(color: Color(0xff838894)),
            ));
      }
      isload = false;
      update();
    }
  }
}
