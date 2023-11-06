import 'package:get/get.dart';

class RadioController extends GetxController {
  String? selectedGender;
  final List<String> gender = ["Male", "Female"];

  String? select;
  void onClickRadioButton(value) {
    select = value;
    update();
  }
}