import 'package:get/get.dart';

class PaymentEditController extends GetxController {
  String payment = "stc";
  String urlImageActive = "";
  @override
  void onInit() {
    changeUrlImageActive();
    super.onInit();
  }

  void changeUrlImageActive() {
    switch (payment) {
      case "stc":
        urlImageActive = "assets/images/payments/stc-pay.png";
        break;
      case 'card':
        urlImageActive = "assets/images/payments/card.png";
        break;
      case 'google-pay':
        urlImageActive = "assets/images/payments/google-pay.png";
        break;
      default:
        urlImageActive = "assets/images/payments/stc-pay.png";
        break;
    }
  }

  void selectPayment(val) {
    payment = val;
    changeUrlImageActive();
    update();
  }
}
