import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/CardPayment.dart';
import 'package:masctti_fashion/components/Payments.dart';
import 'package:masctti_fashion/components/PrimaryButton.dart';
import 'package:masctti_fashion/components/auth/PrimaryTextField.dart';
import 'package:masctti_fashion/components/LayoutSinglePage.dart';
import 'package:masctti_fashion/controllers/PaymentEditController.dart';

class PaymentEdit extends StatelessWidget {
  const PaymentEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutSinglePage(title: 'بطاقات الدفع', children: [
      GetBuilder(
          init: PaymentEditController(),
          builder: (controller) => Payments(
                title: 'بطاقة الدفع الخاصّة بك',
                children: [
                  CardPayment(
                    urlImage: controller.urlImageActive,
                    value: controller.payment,
                    payment: controller.payment,
                    onChanged: (val) {},
                  ),
                ],
              )),
      GetBuilder<PaymentEditController>(
          builder: (controller) => Payments(
                title: 'تغيير بطاقة الدفع',
                children: [
                  CardPayment(
                    urlImage: 'assets/images/payments/stc-pay.png',
                    value: 'stc',
                    payment: controller.payment,
                    onChanged: controller.selectPayment,
                  ),
                  SizedBox(width: 16),
                  CardPayment(
                    urlImage: 'assets/images/payments/card.png',
                    value: 'card',
                    payment: controller.payment,
                    onChanged: controller.selectPayment,
                  ),
                  SizedBox(width: 16),
                  CardPayment(
                    urlImage: 'assets/images/payments/google-pay.png',
                    value: 'google-pay',
                    payment: controller.payment,
                    onChanged: controller.selectPayment,
                  ),
                ],
              )),
      PrimaryTextField(
          label: "الاسم كاملا",
          hintText: "اسم المستخدم",
          validator: (val) => null),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PrimaryTextField(
                keyboardType: TextInputType.datetime,
                label: "تاريخ الانتهاء",
                hintText: "",
                validator: (val) => null),
          ),
          Expanded(
            child: PrimaryTextField(
                keyboardType: TextInputType.number,
                label: "الرقم السرّي",
                hintText: "",
                validator: (val) => null),
          ),
        ],
      ),
      PrimaryTextField(
          label: "الموقع",
          hintText: "المدينة, المحافظة",
          validator: (val) => null),
      PrimaryButton(text: "تأكيد", onPressed: () {})
    ]);
  }
}
