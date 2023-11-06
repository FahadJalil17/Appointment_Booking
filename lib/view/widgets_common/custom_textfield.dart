import 'package:flutter/material.dart';

Widget customTextField({String? title, String? hint,isDesc = false, controller, Widget? sufIcon}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // title!.text.color(color).fontFamily(semibold).size(16).make(),
      SizedBox(height: 15,),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title!),
      ),
      SizedBox(height: 5,),
      TextField(
        maxLines: isDesc ? 4 : 1,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            suffixIcon: sufIcon,


  border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    // color: color
                  color: Colors.black38,
                ),
                  borderRadius: BorderRadius.circular(8),
            )
        ),
      ),
      SizedBox(height: 5,),
    ],
  );
}
