import 'package:get/get.dart';

class BookController extends GetxController {

  List listType = ["Next Available","Dr Rashid Minhas", "Lilama Baig", "Abdullah Khan"];
  final selected = "Next Available".obs;

  void setSelected(String value){
    selected.value = value;
  }

}

