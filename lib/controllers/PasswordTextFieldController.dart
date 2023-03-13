import 'package:get/get.dart';

class PasswordTextFieldController extends GetxController {
  bool isShow = false;
  bool isShowNew = false;

  void showPass(isNew) {
    isNew ? isShowNew = !isShowNew : isShow = !isShow;
    update();
  }
}
