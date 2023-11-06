import 'package:flutter/material.dart';

Widget roundButton({VoidCallback? onPress, Color? color, Color? textColor, String? title}) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: color,
          padding: EdgeInsets.all(12),
        ),

        onPressed: onPress,
        // child: title!.text.color(textColor).fontFamily(bold).make()),
        child: Text(title!, style: TextStyle(color: textColor),)),
  );
}