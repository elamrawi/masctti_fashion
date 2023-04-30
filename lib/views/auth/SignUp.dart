import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/PrimaryButton.dart';
import 'package:masctti_fashion/components/auth/AuthLayout.dart';
import 'package:masctti_fashion/components/auth/ButtonSocial.dart';
import 'package:masctti_fashion/components/auth/ContainerButtonSocial.dart';
import 'package:masctti_fashion/components/auth/LineAuth.dart';
import 'package:masctti_fashion/components/auth/PrimaryTextField.dart';
import 'package:masctti_fashion/components/auth/QuestionAuth.dart';
import 'package:masctti_fashion/components/auth/TitleAuth.dart';
import 'package:masctti_fashion/controllers/auth/SignUpController.dart';

import '../../components/LoadingScreen.dart';
import '../../components/auth/PasswordTextField.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SignUpController(),
        builder: (controller) {
          print('build sign up');
          return controller.isloading
              ? LoadingScreen()
              : AuthLayout(
                  keyForm: controller.keyForm,
                  children: [
                    const TitleAuth(
                        title: 'انشئ حساب جديد',
                        subTitle: 'وأستمتع بأكبر العروض'),
                    PrimaryTextField(
                      controllerTextField: controller.email,
                      label: 'البريد الالكتروني',
                      hintText: 'البريد الالكتروني',
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? val) {
                        if (val == '') return 'يجب ملأ حقل بريد الالكتروني.';
                        if (!val!.isEmail) return 'يجب ان يكون بريد الكتروني.';
                      },
                    ),
                    PrimaryTextField(
                      controllerTextField: controller.username,
                      label: 'اسم المستخدم',
                      hintText: "اسم المستخدم",
                      keyboardType: TextInputType.name,
                      validator: (String? val) {
                        if (val == '') return 'يجب ملأ حقل اسم المستخدم.';
                        if (val!.length < 3) return 'اسم المستخدم قصير جداً.';
                      },
                    ),
                    PasswordTextField(
                      controllerTextField: controller.password,
                      label: 'كلمة المرور',
                      hintText: "",
                      keyboardType: TextInputType.visiblePassword,
                      validator: (String? val) {
                        if (val == '') return 'يجب ملأ حقل كلمة المرور.';
                        if (val!.length < 8)
                          return "يجب ان تحتوي كلمة السر على 8 أحرف على الأقل.";
                      },
                    ),
                    PrimaryButton(
                      text: 'انشاء حساب',
                      onPressed: controller.signUp,
                    ),
                    LineAuth('أنشئ من خلال'),
                    ContainerButtonSocial(),
                    QuestionAuth(
                      text: 'بالفعل لديك حساب ؟ ',
                      textLink: "سجل الدخول",
                      onTap: () {
                        Get.offNamed('/login');
                      },
                    )
                  ],
                );
        });
  }
}
