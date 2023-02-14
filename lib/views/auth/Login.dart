import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/PrimaryButton.dart';
import 'package:masctti_fashion/components/auth/AuthLayout.dart';
import 'package:masctti_fashion/components/auth/ButtonSocial.dart';
import 'package:masctti_fashion/components/auth/ContainerButtonSocial.dart';
import 'package:masctti_fashion/components/auth/LineAuth.dart';
import 'package:masctti_fashion/components/auth/QuestionAuth.dart';
import 'package:masctti_fashion/components/auth/PrimaryTextField.dart';
import 'package:masctti_fashion/components/auth/QuestionForgotPassword.dart';
import 'package:masctti_fashion/components/auth/TitleAuth.dart';
import 'package:masctti_fashion/controllers/LoginController.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final GlobalKey<FormState> _keyForm = GlobalKey();
  // final  c = Get.lazyPut(()=>LoginController());
  @override
  Widget build(BuildContext context) {
    return AuthLayout(keyForm: _keyForm, children: [
      const TitleAuth(title: "سجل الدخول", subTitle: "لنبدأ التسوق معاً !"),
      PrimaryTextField(
        label: "البريد الالكتروني او رقم الهاتف",
        hintText: "اسم المستخدم",
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          return null;
        },
      ),
      PrimaryTextField(
        label: "كلمة المرور",
        hintText: "",
        isPass: true,
        keyboardType: TextInputType.visiblePassword,
        validator: (val) => null,
      ),
      // remember me and forgot your password ?
      Padding(
        padding: const EdgeInsets.only(top: 10, right: 16, left: 16),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Text(
                "تذكرني",
                style: TextStyle(
                    fontSize: 16, color: Color(0xff31394D).withOpacity(0.6)),
              ),
              GetBuilder(
                init: LoginController(),
                builder: (controller) => Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  // splashRadius: 0,
                  visualDensity: VisualDensity.compact,
                  side: BorderSide(
                    color: Color(0xff838894),
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  value: controller.rememberMe,
                  onChanged: controller.CheckRememberMe,
                ),
              ),
            ],
          ),
          QuestionForgotPassword()
        ]),
      ),
      PrimaryButton(
          text: 'تسجيل الدخول',
          onPressed: () {
            Get.offNamed('/profile');
          }),
      LineAuth('سجّل من خلال'),
      ContainerButtonSocial(),
      QuestionAuth(
        text: 'ليس لديك حساب ؟ ',
        textLink: 'انشئ الآن',
        onTap: () {
          Get.offNamed('/sign-up');
        },
      )
    ]);
  }
}
