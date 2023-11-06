import 'package:appointment_booking/view/screens/book_appointement_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appointment Booking',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: BookAppointmentScreen(),
    );
  }
}


