// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({ Key? key }) : super(key: key);

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: SingleChildScrollView(
               child: Container(alignment: Alignment.center,
                 child: Column(
                         children: [
                           SizedBox(height:DBLNewHeight(0.1)),
                           customUserImg(),
                           SizedBox(height:DBLNewHeight(0.1)),
                           customUserName('John Wat Now'),
                           SizedBox(height:DBLNewHeight(0.1)),
                           customUserEmail('email@whatnow.com'),
                         ],),
               ),
            ),
    );
  }

//sizes
  double DBLNewSize(double per) {
    return ((MediaQuery.of(context).size.height * per) +
            MediaQuery.of(context).size.width * per) /
        2;
  }

  double DBLNewHeight(double per) {
    return MediaQuery.of(context).size.height * per;
  }

  double DBLNewWidth(double per) {
    return MediaQuery.of(context).size.width * per;
  }

  //customAppBar
  AppBar customAppBar() {
    return AppBar(
      backgroundColor: Colors.pinkAccent,
      title: Text(
        'User Profile',
        style: TextStyle(fontSize: 15.0),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            icon: Icon(Icons.close)),
        SizedBox(
          width: 20.0,
        )
      ],
    );
  }

  //customUserImg
  SizedBox customUserImg() {
    return SizedBox(
      width: DBLNewWidth(0.9),
      height: DBLNewHeight(0.15),
      child: Icon(
        Icons.person_rounded,
        color: Colors.blue,
        size: DBLNewSize(0.2),
      ),
    );
  }

  //customUserName
  Text customUserName(String name) {
    return Text(
      name,
      style: TextStyle(
        fontSize: DBLNewSize(0.07),
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.start,
    );
  }

  //customUserEmail
  Text customUserEmail(String email) {
    return Text(
      email,
      style: TextStyle(
        fontSize: DBLNewSize(0.03),
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.start,
    );
  }
}