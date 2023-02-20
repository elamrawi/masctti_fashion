import 'package:get/get.dart';

class LayoutController extends GetxController {
  int indexPage = 0;
  void ChangePage(index) {
    indexPage = index;
    update();
  }
}
