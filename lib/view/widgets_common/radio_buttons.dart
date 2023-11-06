import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/radio_controller.dart';

var profilePageController  = Get.put(RadioController());
Widget addRadioButton(int btnIndex, String title) {
  return Column(
    children: [
      // Text("Birth Gender"),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GetBuilder<RadioController>(
            builder: (_) => Radio(
                activeColor: Colors.pink,
                value: profilePageController.gender[btnIndex],
                groupValue: profilePageController.select,
                onChanged: (value) =>
                    profilePageController.onClickRadioButton(value)),
          ),
          Text(title, style: profilePageController.gender[btnIndex] == 0 ? TextStyle(color: Colors.pink) : profilePageController.gender[btnIndex] == 1 ? TextStyle(color: Colors.pink) : TextStyle(color: Colors.black),)
        ],
      ),
    ],
  );
}

