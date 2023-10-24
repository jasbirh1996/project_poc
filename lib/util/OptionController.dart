import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OptionController extends GetxController {
  RxString selectedOption = "Professional".obs;

  void selectOption(String option) {
    selectedOption.value = option;
  }
}