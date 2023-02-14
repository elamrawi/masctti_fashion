import 'package:get/get.dart';

class LoginController extends GetxController {
  bool rememberMe = false;
  void CheckRememberMe(val) {
    rememberMe = val;
    update();
  }
}
