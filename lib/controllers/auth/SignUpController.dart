import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/models/Customer.dart';
import 'package:masctti_fashion/server/api.dart';
import 'package:masctti_fashion/server/UserInfo.dart';

class SignUpController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();
  final GlobalKey<FormState> keyForm = GlobalKey();
  bool isload = false;
  void signUp() async {
    if (keyForm.currentState!.validate()) {
      isload = true;
      update();
      Map<String, dynamic> customer = await Api.createCustomer(
          email: email.text, username: username.text, password: password.text);
      if (customer.keys.contains('code')) {
        if (customer['code'] == 'registration-error-email-exists') {
          Get.defaultDialog(
              textCancel: 'حسناً',
              radius: 6,
              titlePadding: EdgeInsets.only(top: 20),
              title: "خطأ في المدخلات",
              content: Text(
                "الايميل موجود بالفعل !!!",
                style: TextStyle(color: Color(0xff838894)),
              ));
        } else if (customer['code'] == 'registration-error-username-exists') {
          Get.defaultDialog(
              textCancel: 'حسناً',
              radius: 6,
              titlePadding: EdgeInsets.only(top: 20),
              title: "خطأ في المدخلات",
              content: Text(
                "اسم المستخدم موجود بالفعل !!!",
                style: TextStyle(color: Color(0xff838894)),
              ));
        } else if (customer['code'] == 'registration-error-invalid-email') {
          Get.defaultDialog(
              textCancel: 'حسناً',
              radius: 6,
              titlePadding: EdgeInsets.only(top: 20),
              title: "خطأ في المدخلات",
              content: Text(
                "البريد الالكتروني فارغ !!!",
                style: TextStyle(color: Color(0xff838894)),
              ));
        }
        isload = false;
        update();
      } else {
        await UserInfo.setAllData(Customer.fromJson(customer));
        // edit layout
        Get.offAllNamed('/layout');
      }
    }
  }
}
