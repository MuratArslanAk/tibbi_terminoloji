import 'package:get/get.dart';

class TermoDashBoardController extends GetxController {
  var buttomIndex = 0;
  void changeButtomIndex(int index) {
    buttomIndex = index;
    update();
  }
}
