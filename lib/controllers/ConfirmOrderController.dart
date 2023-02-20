import 'package:get/get.dart';

class ConfirmOrderController extends GetxController {
  String payment = 'cash_payment';
  String selectPay = 'stc';
  void changePay(val) {
    payment = val;
    update();
  }
  void selectPayment(val){
    selectPay = val;
    update();
  }
}
