import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/PrimaryButton.dart';
import 'package:masctti_fashion/components/auth/AuthLayout.dart';
import 'package:masctti_fashion/components/auth/ContainerButtonSocial.dart';
import 'package:masctti_fashion/components/auth/LineAuth.dart';
import 'package:masctti_fashion/components/auth/QuestionAuth.dart';
import 'package:masctti_fashion/components/auth/PrimaryTextField.dart';
import 'package:masctti_fashion/components/auth/QuestionForgotPassword.dart';
import 'package:masctti_fashion/components/auth/TitleAuth.dart';
import 'package:masctti_fashion/controllers/auth/LoginController.dart';

import '../../components/LoadingScreen.dart';
import '../../components/auth/PasswordTextField.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return controller.isload
              ? LoadingScreen()
              : AuthLayout(keyForm: controller.keyForm, children: [
                  const TitleAuth(
                      title: "سجل الدخول", subTitle: "لنبدأ التسوق معاً !"),
                  GetBuilder<LoginController>(builder: (controller) {
                    return PrimaryTextField(
                      controllerTextField: controller.email,
                      label: " البريد الالكتروني أو اسم المستخدم",
                      hintText: "اسم المستخدم",
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? val) {
                        if (val == '') return 'يجب ملأ حقل اسم المستخدم.';
                      },
                    );
                  }),
                  GetBuilder<LoginController>(builder: (controller) {
                    return PasswordTextField(
                      controllerTextField: controller.password,
                      label: "كلمة المرور",
                      hintText: "",
                      keyboardType: TextInputType.visiblePassword,
                      validator: (String? val) {
                        if (val == '') return 'يجب ملأ حقل كلمة المرور.';
                        if (val!.length < 8)
                          return "يجب ان تحتوي كلمة السر على 8 أحرف على الأقل.";
                      },
                    );
                  }),
                  // remember me and forgot your password ?
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 16, left: 16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "تذكرني",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff31394D).withOpacity(0.6)),
                              ),
                              GetBuilder<LoginController>(
                                builder: (controller) => Checkbox(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
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
                    onPressed: controller.login,
                  ),
                  LineAuth('سجّل من خلال'),
                  ContainerButtonSocial(),
                  QuestionAuth(
                    text: 'ليس لديك حساب ؟ ',
                    textLink: 'انشئ الآن',
                    onTap: () async {
                      Get.offNamed('/sign-up');
                    },
                  )
                ]);
        });
  }
}
