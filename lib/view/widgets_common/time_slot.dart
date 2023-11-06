import 'package:flutter/material.dart';

Widget timeSlot({String? title, Color textColor = Colors.black, Color backColor = Colors.white70,  Color borderColor = Colors.black}){
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
          width: 70,
          height: 40,
          decoration: BoxDecoration(
          color: backColor,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 1,
              color: borderColor
            )
          ),
          child: Center(child: Text("$title",
            style: TextStyle(fontSize: 14, color: textColor),))),
    );
  }
