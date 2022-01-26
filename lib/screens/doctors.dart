// ignore_for_file: prefer_const_constructors

import 'package:doctor_appointment_booking/classes/doctor.dart';
import 'package:flutter/material.dart';

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {

    //list of doctors
    List<Doctor> doctors = [];
    doctors.add(Doctor(name: 'Kevin White', specialty: 'Cardiologist'));
    doctors.add(Doctor(name: 'Jake Pini', specialty: 'Dermatologist'));
    doctors.add(Doctor(name: 'Maya Angie', specialty: 'Pediatrician'));
    doctors.add(Doctor(name: 'Maya Angie', specialty: 'Pediatrician'));
    doctors.add(Doctor(name: 'Kevin White', specialty: 'Cardiologist'));
    doctors.add(Doctor(name: 'Jake Pini', specialty: 'Dermatologist'));
    doctors.add(Doctor(name: 'Maya Angie', specialty: 'Pediatrician'));
    doctors.add(Doctor(name: 'Maya Angie', specialty: 'Pediatrician'));
    doctors.add(Doctor(name: 'Kevin White', specialty: 'Cardiologist'));
    doctors.add(Doctor(name: 'Jake Pini', specialty: 'Dermatologist'));
    doctors.add(Doctor(name: 'Maya Angie', specialty: 'Pediatrician'));
    doctors.add(Doctor(name: 'Maya Angie', specialty: 'Pediatrician'));
    doctors.add(Doctor(name: 'Kevin White', specialty: 'Cardiologist'));
    doctors.add(Doctor(name: 'Jake Pini', specialty: 'Dermatologist'));
    doctors.add(Doctor(name: 'Maya Angie', specialty: 'Pediatrician'));
    doctors.add(Doctor(name: 'Maya Angie', specialty: 'Pediatrician'));
    doctors.add(Doctor(name: 'Kevin White', specialty: 'Cardiologist'));
    doctors.add(Doctor(name: 'Jake Pini', specialty: 'Dermatologist'));
    doctors.add(Doctor(name: 'Maya Angie', specialty: 'Pediatrician'));
    doctors.add(Doctor(name: 'Maya Angie', specialty: 'Pediatrician'));            

    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {

        if (orientation == Orientation.portrait) {

          return Scaffold(
            appBar: customAppBar(),
            body: SingleChildScrollView(
               child: Container(
                       alignment: Alignment.center,
                       child: customListSizedBox(doctors),
                    ) ,
               ),

          );
        } else {
          return Scaffold(
            appBar: customAppBar(),
            body: SingleChildScrollView(
               child: Container(
                       alignment: Alignment.center,
                       child: customListSizedBox(doctors),
                    ) ,
               ),

          );
        }
      },
    );
  }



  //child widgets
    SizedBox customListSizedBox(List doctors) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.9,
      height:  MediaQuery.of(context).size.height*0.9,
      child: ListView.builder(
          itemCount: doctors.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.person_outline),
                title: Text(doctors[index].name),
                subtitle: Text(doctors[index].specialty),
                onTap: () {},
              ),
            );
          }),
    );
  }

    //customAppBar
  AppBar customAppBar() {
    return AppBar(
      backgroundColor: Colors.pinkAccent,
      title: Text(
        'DOCTORS',
        style: TextStyle(fontSize: 15.0),
      ),
      actions: [
        IconButton(onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        }, icon: Icon(Icons.close)),
        SizedBox(
          width: 20.0,
        )
      ],
    );
  }
}
