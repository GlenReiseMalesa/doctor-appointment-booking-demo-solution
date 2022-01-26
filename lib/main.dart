// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors


import 'package:doctor_appointment_booking/screens/doctordetails.dart';
import 'package:doctor_appointment_booking/screens/doctors.dart';
import 'package:doctor_appointment_booking/screens/login.dart';
import 'package:doctor_appointment_booking/screens/register.dart';
import 'package:doctor_appointment_booking/screens/userdasboard.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor\'s Appointment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      routes: {
        '/doctors':(context)=> Doctors(),
        '/login':(context)=> Login(),
        '/register':(context)=> Register(),
        '/home':(context)=> Home(),
        '/doctordetails':(context)=> DoctorDetails(),
        '/userdashboard':(context)=> UserDashboard(),
      },
    );
  }
}

