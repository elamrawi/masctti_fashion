import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/components/LayoutSinglePage.dart';
import 'package:masctti_fashion/components/LoadingScreen.dart';
import 'package:masctti_fashion/components/PrimaryButton.dart';
import 'package:masctti_fashion/components/PrimaryDropDown.dart';
import 'package:masctti_fashion/components/TitlePage.dart';
import 'package:masctti_fashion/components/auth/PrimaryTextField.dart';
import 'package:masctti_fashion/components/order/ShowPrice.dart';
import 'package:masctti_fashion/controllers/ConfirmOrderController.dart';
import 'package:masctti_fashion/controllers/LayoutController.dart';

import '../components/CardPayment.dart';
import '../components/Payments.dart';

class ConfirmOrder extends StatelessWidget {
  ConfirmOrder({super.key});
  final LayoutController layoutController = Get.put(LayoutController());
  String total = Get.arguments['total'].toString();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfirmOrderController>(
        init: ConfirmOrderController(),
        builder: (controller) => controller.isloading
            ? LoadingScreen()
            : LayoutSinglePage(
                alignment: Alignment.topRight,
                title: 'تأكيد عملية الشراء',
                children: [
                  TitlePage('شكراً على ثقتك بنا'),
                  SizedBox(
                    height: 10,
                  ),
                  ShowPrice(title: 'سعر المنتجات المطلوبة ', price: total),
                  GetBuilder<ConfirmOrderController>(builder: (controller) {
                    return PrimaryDropDown(
                      value: controller.delivery,
                      items: [
                        {
                          'text': 'خدمة التوصيل',
                          'value': 'delivery',
                        },
                        {
                          'text': 'استلام من المعرض',
                          'value': 'receipt',
                        },
                      ],
                      title: 'آلية استلام المنتجات',
                      onChange: controller.selectDelivery,
                    );
                  }),
                  GetBuilder<ConfirmOrderController>(builder: (controller) {
                    return PrimaryDropDown(
                        value: controller.payment,
                        items: [
                          {
                            'text': 'الدفع عند الاستلام',
                            'value': 'cash_payment',
                          },
                          {
                            'text': 'الدفع الالكتروني',
                            'value': 'only_payment',
                          },
                        ],
                        title: 'طريقة الدفع',
                        onChange: controller.changePay);
                  }),
                  GetBuilder<ConfirmOrderController>(
                    builder: (controller) {
                      if (controller.payment == 'only_payment') {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Payments(
                                title: 'تغيير بطاقة الدفع',
                                children: [
                                  CardPayment(
                                    urlImage:
                                        'assets/images/payments/stc-pay.png',
                                    value: 'stc',
                                    payment: controller.selectPay,
                                    onChanged: controller.selectPayment,
                                  ),
                                  SizedBox(width: 16),
                                  CardPayment(
                                    urlImage: 'assets/images/payments/card.png',
                                    value: 'card',
                                    payment: controller.selectPay,
                                    onChanged: controller.selectPayment,
                                  ),
                                  SizedBox(width: 16),
                                  CardPayment(
                                    urlImage:
                                        'assets/images/payments/google-pay.png',
                                    value: 'google-pay',
                                    payment: controller.selectPay,
                                    onChanged: controller.selectPayment,
                                  ),
                                ],
                              ),
                              PrimaryTextField(
                                  controllerTextField: TextEditingController(),
                                  label: 'الاسم كاملاً',
                                  hintText: "وسام زياد محمود مهدي",
                                  prefix: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 10),
                                    child: Image.asset(
                                      'assets/images/payments/stc-pay.png',
                                      height: 11,
                                      width: 35,
                                    ),
                                  ),
                                  validator: (val) {}),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: PrimaryTextField(
                                        controllerTextField:
                                            TextEditingController(),
                                        keyboardType: TextInputType.datetime,
                                        label: "تاريخ الانتهاء",
                                        hintText: "السنة/الشهر",
                                        validator: (val) => null),
                                  ),
                                  Expanded(
                                    child: PrimaryTextField(
                                        controllerTextField:
                                            TextEditingController(),
                                        keyboardType: TextInputType.number,
                                        label: "الرقم السرّي",
                                        hintText: "1123",
                                        validator: (val) => null),
                                  ),
                                ],
                              ),
                              PrimaryTextField(
                                  controllerTextField: TextEditingController(),
                                  label: "الموقع",
                                  hintText: "المدينة, المحافظة",
                                  validator: (val) => null),
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  ShowPrice(title: 'سعر المنتجات المطلوبة ', price: total),
                  GetBuilder<ConfirmOrderController>(
                      builder: (controller) =>
                          (controller.delivery == 'delivery')
                              ? ShowPrice(title: 'خدمة التوصيل ', price: "12")
                              : Container()),
                  PrimaryButton(
                      text: 'تأكيد عملية الشراء',
                      onPressed: () {
                        controller.sendOrder(controller.delivery);
                      })
                ],
              ));
  }
}
