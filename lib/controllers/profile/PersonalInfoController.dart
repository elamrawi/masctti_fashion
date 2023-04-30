import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/models/Customer.dart';
import 'package:masctti_fashion/server/UserInfo.dart';
import 'package:masctti_fashion/server/api.dart';

class PersonalInfoController extends GetxController {
  bool isload = false;
  final GlobalKey<FormState> keyForm = GlobalKey();
  // final TextEditingController username =
  //     TextEditingController(text: UserInfo.box.read('username'));
  final TextEditingController firstName =
      TextEditingController(text: UserInfo.box.read('first_name'));
  final TextEditingController lastName =
      TextEditingController(text: UserInfo.box.read('last_name'));
  final TextEditingController email =
      TextEditingController(text: UserInfo.box.read('email'));
  final TextEditingController phone =
      TextEditingController(text: UserInfo.phone);
  final TextEditingController location =
      TextEditingController(text: UserInfo.location);
  updateInfo() async {
    if (keyForm.currentState!.validate()) {
      isload = true;
      update();
      List locations = location.text.split(RegExp('[.,،]'));
      String city = locations[0].trim();
      String country = locations[1].trim();
      Map<String, dynamic> newCustomer = await Api.updateCustomer(
        UserInfo.box.read('id'),
        firstName: firstName.text,
        lastName: lastName.text,
        email: email.text,
        phone: phone.text,
        city: city,
        country: country,
      );
      Customer customer = Customer.fromJson(newCustomer);
      await UserInfo.setPersonalInfo(customer);
      Get.defaultDialog(
          textCancel: 'حسناً',
          radius: 6,
          titlePadding: EdgeInsets.only(top: 20),
          title: "تم تحديث البيانات",
          content: Text(
            'تم تحديث معلوماتك الشخصية بنجاح',
            style: TextStyle(color: Color(0xff838894)),
          ));
      isload = false;
      update();
    }
  }
}
