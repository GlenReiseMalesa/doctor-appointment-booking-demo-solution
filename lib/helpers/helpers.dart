import 'package:flutter/material.dart';

String validateEmail(String value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value) || value == null)
    return 'Enter a valid email address';
  else
    return 'Please Provide A Valid Email Address';
}

InputDecoration buildInputDecoration(String hintText, IconData icon){
  return InputDecoration(
    prefixIcon: Icon(icon, color:const Color.fromRGBO(50, 62, 72, 1.0)),

    //hintText
    contentPadding: const EdgeInsets.fromLTRB(20.0,15.0,20.0,15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
  );
}

//Scaffold footer navigation widget
 BottomNavigationBar footer(){
    return BottomNavigationBar(
         
            fixedColor: Colors.black,
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
                  
                   BottomNavigationBarItem(
                     icon: Icon(Icons.home),
                     label: 'Home',
                      
                   ),
                   BottomNavigationBarItem(
                     icon: Icon(Icons.schedule),
                     label: 'Schedule',
                   ),
                   BottomNavigationBarItem(
                     icon: Icon(Icons.chat),
                     label: 'Chat'
                   ),
                   BottomNavigationBarItem(
                     icon: Icon(Icons.person),
                     label: 'Account'
                   ),
            ]

          );
  }