import 'package:flutter/material.dart';
import 'package:masctti_fashion/components/PrimaryButton.dart';
import 'package:masctti_fashion/components/auth/PrimaryTextField.dart';
import 'package:masctti_fashion/components/profile/AvatarEdit.dart';
import 'package:masctti_fashion/components/profile/ProfileLayout.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileLayout(title: "المعلومات الشخصية", children: [
      Align(alignment: Alignment.centerRight, child: AvatarEdit()),
      PrimaryTextField(
          label: 'اسم المستخدم',
          hintText: "اسم المستخدم",
          validator: (val) => null),
      PrimaryTextField(
          label: 'البريد الالكتروني',
          hintText: "البريد الالكتروني",
          validator: (val) => null),
      PrimaryTextField(
          label: 'رقم الهاتف',
          hintText: "+972 59 208-3110",
          validator: (val) => null),
      PrimaryTextField(
          label: 'العنوان',
          hintText: "المدينة , المحافظة",
          validator: (val) => null),
      PrimaryButton(text: 'تأكيد', onPressed: () {})
    ]);
  }
}
