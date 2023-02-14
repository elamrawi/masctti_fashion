import 'package:get/get.dart';

class PrimaryTextFieldController extends GetxController {
  bool isShow = false;

  void showPass() {
    isShow = !isShow;
    update();
  }
}
