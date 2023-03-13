import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/models/Customer.dart';
import 'package:masctti_fashion/server/api.dart';
import 'package:masctti_fashion/server/UserInfo.dart';

class LoginController extends GetxController {
  bool rememberMe = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> keyForm = GlobalKey();
  bool isload = false;
  void CheckRememberMe(val) {
    rememberMe = val;
    update();
  }

  void login() async {
    if (keyForm.currentState!.validate()) {
      isload = true;
      update();
      Map<String, dynamic> response =
          await Api.login(email.text, password.text);
      if (!response['state']) {
        Get.defaultDialog(
            textCancel: 'حسناً',
            onCancel: () {
              Get.back();
            },
            radius: 6,
            titlePadding: EdgeInsets.only(top: 20),
            title: "خطأ في تسجيل الدخول",
            content: Text(
              "يوجد خطأ في تسجيل الدخول وهو إما البيانات المدخلة غير صحيحة أو لا يوجد اتصال بالانترنت.",
              style: TextStyle(color: Color(0xff838894)),
            ));
        password.clear();
      } else {
        Customer customer =
            await Api.getCustomer(response['data']['user_email']);
        // add code storage
        await UserInfo.setAllData(customer);
        await Get.offNamed('layout');
        email.dispose();
        password.dispose();
      }
      isload = false;
      update();
    }
  }
}
