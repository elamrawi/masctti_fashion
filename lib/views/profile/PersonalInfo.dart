import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/PrimaryButton.dart';
import 'package:masctti_fashion/components/auth/PrimaryTextField.dart';
import 'package:masctti_fashion/components/profile/AvatarEdit.dart';
import 'package:masctti_fashion/components/LayoutSinglePage.dart';
import 'package:masctti_fashion/controllers/profile/PersonalInfoController.dart';
import 'package:masctti_fashion/server/UserInfo.dart';

import '../../components/LoadingScreen.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PersonalInfoController(),
        builder: (controller) => controller.isload
            ? LoadingScreen()
            : LayoutSinglePage(
                title: "المعلومات الشخصية",
                keyForm: controller.keyForm,
                children: [
                    Align(
                        alignment: Alignment.centerRight, child: AvatarEdit()),
                    // PrimaryTextField(
                    //     controllerTextField: controller.username,
                    //     label: 'اسم المستخدم',
                    //     hintText: "اسم المستخدم",
                    //     validator: (String? val) {
                    //       if (val == '') return 'يجب ملأ حقل اسم المستخدم.';
                    //       if (val!.length < 3) return 'اسم المستخدم قصير جداً.';
                    //     }),
                    PrimaryTextField(
                        controllerTextField: controller.firstName,
                        label: 'الاسم الأول',
                        hintText: "الاسم الأول",
                        validator: (String? val) {
                          if (val == '') return 'يجب ملأ حقل الاسم الأول';
                        }),
                    PrimaryTextField(
                        controllerTextField: controller.lastName,
                        label: 'الأسم الأخير',
                        hintText: "الأسم الأخير",
                        validator: (String? val) {
                          if (val == '') return 'يجب ملأ حقل الأسم الأخير.';
                        }),
                    PrimaryTextField(
                        controllerTextField: controller.email,
                        label: 'البريد الالكتروني',
                        hintText: "البريد الالكتروني",
                        validator: (String? val) {
                          if (val == '') return 'يجب ملأ حقل بريد الالكتروني.';
                          if (!val!.isEmail)
                            return 'يجب ان يكون بريد الكتروني.';
                        }),
                    PrimaryTextField(
                        keyboardType: TextInputType.phone,
                        controllerTextField: controller.phone,
                        label: 'رقم الهاتف',
                        hintText: "+972 59 208-3110",
                        validator: (val) => null),
                    PrimaryTextField(
                        keyboardType: TextInputType.streetAddress,
                        controllerTextField: controller.location,
                        label: 'العنوان',
                        hintText: "المدينة , المحافظة",
                        validator: (String? val) {
                          if (val!.split(RegExp('[.,،]')).length != 2)
                            return 'يرجى ادخال العنوان بالصيغة المطلوبة';
                        }),
                    PrimaryButton(
                        text: 'تأكيد', onPressed: controller.updateInfo)
                  ]));
  }
}
