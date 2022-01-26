// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return Scaffold(
            appBar: customAppBar(),
            body: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              child: customRegisterSizedBox(),
            ),
          );
        } else {
          return Scaffold(
            appBar: customAppBar(),
            body: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              child: customRegisterSizedBox(),
            ),
          );
        }
      },
    );
  }

  //customAppBar
  AppBar customAppBar() {
    return AppBar(
      backgroundColor: Colors.pinkAccent,
      title: Text(
        'REGISTER',
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

  //customRegisterSizedBox
  SizedBox customRegisterSizedBox() {
    return SizedBox(
      width:  MediaQuery.of(context).size.width*0.9,
      height: MediaQuery.of(context).size.height*0.8,
      child: Form(child: Column(
               children: [
                   SizedBox(height: 10.0,),
                    SizedBox(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      decoration: InputDecoration(
                          labelText: "Enter Your FullName",
                          labelStyle: TextStyle(
                            color: Colors.pinkAccent,
                          ),
                          border: OutlineInputBorder()),
                    )),
                    SizedBox(height: 30.0,),
                   SizedBox(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      decoration: InputDecoration(
                          labelText: "Enter Your Email",
                          labelStyle: TextStyle(
                            color: Colors.pinkAccent,
                          ),
                          border: OutlineInputBorder()),
                    )),
                    SizedBox(height: 30.0,),
                    SizedBox(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      decoration: InputDecoration(
                          labelText: "Enter Your Password",
                          labelStyle: TextStyle(
                            color: Colors.pinkAccent,
                          ),
                          border: OutlineInputBorder()),
                    )),
                    SizedBox(height: 30.0,),
                    SizedBox(
                        width: MediaQuery.of(context).size.width*0.8,
                        child: MaterialButton(
                          onPressed: () {},
                          textColor: Colors.white,
                          color: Colors.pinkAccent,
                          child: SizedBox(
                            width: double.infinity,
                            child: Icon(Icons.arrow_forward),
                          ),
                          height: MediaQuery.of(context).size.height*0.08,
                          minWidth: MediaQuery.of(context).size.width*0.8,
                        ),
                      ),
               ],
               ),
             ),

    );
  }
}