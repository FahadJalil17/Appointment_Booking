import 'package:flutter/material.dart';

import 'custom_textfield.dart';

Future dialogBox(context) {
  var nameController = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min, // for dialog box size
              children: [
                customTextField(
                    controller: nameController,
                    title: "Patient's Name",
                    hint: "Enter name",
                    sufIcon: Icon(Icons.person)),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        );
      });
}
