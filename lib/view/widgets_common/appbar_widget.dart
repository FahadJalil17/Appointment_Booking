import 'package:flutter/material.dart';

String profileImage = 'https://www.shutterstock.com/image-vector/smiling-graduate-student-wearing-academic-robe-600w-2135119037.jpg';


AppBar appbarWidget({title}){  // it is of appbar type
  return AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    elevation: 0,
    title: Text("Book Appointment", style: TextStyle(color: Colors.black),),
    centerTitle: true,

    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          ),
          onPressed: (){

          },
        );
      },
    ),
    
  );
}