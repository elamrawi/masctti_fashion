import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masctti_fashion/models/LineItems.dart';
import 'package:masctti_fashion/server/api.dart';

class ConfirmOrderController extends GetxController {
  String payment = 'cash_payment';
  String selectPay = 'stc';
  String delivery = 'delivery';
  List<LineItems> lineItems = [];
  bool isloading = false;
  @override
  void onInit() {
    lineItems = Get.arguments['lineItems'];
    super.onInit();
  }

  void changePay(val) {
    payment = val;
    update();
  }

  void selectPayment(val) {
    selectPay = val;
    update();
  }

  void selectDelivery(val) {
    delivery = val;
    update();
  }

  void sendOrder(String delivery) async {
    isloading = true;
    update();
    var respone = await Api.createOrder(lineItems, delivery);
    if (respone.keys.contains('code')) {
      if (respone['code'] == 'rest_invalid_param')
        Get.defaultDialog(
            textCancel: 'حسناً',
            actions: [
              ElevatedButton(
                child: Text(
                  'الذهاب',
                ),
                onPressed: () {
                  Get.back();
                  Get.toNamed('/personal-info');
                },
              )
            ],
            radius: 6,
            titlePadding: EdgeInsets.only(top: 20),
            title: "البيانات فارغة",
            content: Text(
              "قم بملأ جميع البيانات (اسم الأول ,الاسم الأخير , المدينة , المنطقة )",
              style: TextStyle(color: Color(0xff838894)),
            ));
               isloading = false;
    update();
    } else {
      Get.offAllNamed('layout',arguments: {'message': 'تم ارسال الطلب بنجاح'});
    }
  }
}
