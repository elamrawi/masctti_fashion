import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/PrimaryButton.dart';
import 'package:masctti_fashion/components/auth/AuthLayout.dart';
import 'package:masctti_fashion/components/auth/BoxCode.dart';
import 'package:masctti_fashion/components/auth/TitleAuth.dart';
import 'package:masctti_fashion/controllers/PasswordRecoveryController.dart';

class PasswordRecovery extends StatelessWidget {
  GlobalKey keyForm = GlobalKey();
  List<FocusNode> boxcodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode()
  ];
  // PasswordRecoveryController controller = Get.put(PasswordRecoveryController());

  @override
  Widget build(BuildContext context) {
    return AuthLayout(keyForm: keyForm, children: [
      const TitleAuth(
          title: "ادخل كود التأكيد",
          subTitle: "ارسلنا الكود عبر الايميل الخاص بحسابك"),
      Container(
        width: 252,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: boxcodes
              .map<Widget>((boxcode) => BoxCode(
                    boxcode,
                    onChanged: (val) {
                      boxcode.nextFocus();
                    },
                  ))
              .toList(),
        ),
      ),
      PrimaryButton(
        text: "تأكيد",
        onPressed: () {
          Get.offNamed('/new-password');
        },
      )
    ]);
  }
}
