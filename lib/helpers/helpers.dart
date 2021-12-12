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
    prefixIcon: Icon(icon, color:Color.fromRGBO(50, 62, 72, 1.0)),

    //hintText
    contentPadding: EdgeInsets.fromLTRB(20.0,15.0,20.0,15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}