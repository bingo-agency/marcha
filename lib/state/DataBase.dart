import 'package:get/get.dart';

class DataBase extends GetxController {
  var counter = 0.obs;

  void incrementCounter() {
    counter++;
    update();
  }
}
