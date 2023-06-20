import 'package:get/get.dart';

class DataBase extends GetxController {
  var counter = 0.obs;

  String initial_city = 'Select City';

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void incrementCounter() {
    counter++;
    update();
  }

  void getPermission() {
    update();
  }

  void getCurrentlocation() {
    update();
  }

  void setCity(city) {
    update();
  }
}
