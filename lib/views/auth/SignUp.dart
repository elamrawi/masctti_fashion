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

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final GlobalKey<FormState> _keyForm = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      keyForm: _keyForm,
      children: [
        const TitleAuth(
            title: 'انشئ حساب جديد', subTitle: 'وأستمتع بأكبر العروض'),
        PrimaryTextField(
          label: 'البريد الالكتروني',
          hintText: 'البريد الالكتروني',
          keyboardType: TextInputType.emailAddress,
          validator: (val) => null,
        ),
        PrimaryTextField(
          label: 'اسم المستخدم',
          hintText: "اسم المستخدم",
          keyboardType: TextInputType.name,
          validator: (val) => null,
        ),
        PrimaryTextField(
          label: 'كلمة المرور',
          hintText: "",
          keyboardType: TextInputType.visiblePassword,
          validator: (val) => null,
          isPass: true,
        ),
        PrimaryButton(
            text: 'انشاء حساب',
            onPressed: () {
              Get.offNamed('/profile');
            }),
        LineAuth('أنشئ من خلال'),
        ContainerButtonSocial(),
        QuestionAuth(
          text: 'بالفعل لديك حساب ؟ ',
          textLink: "سجل الدخول",
          onTap: () {
            Get.offNamed('/');
          },
        )
      ],
    );
  }
}
