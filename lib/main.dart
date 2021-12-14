// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'helpers/helpers.dart';

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
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: footer(),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < 720) {
            //if it's a phone screen
            return Column(
              children: <Widget>[
                header(5.0),
                SizedBox(height: 6.0,),
                search(20.0),
                flexbox(10.0),
              ],
            );
          } else {
            //if it's a tablet or pc screen
            return Column(
              children: <Widget>[
                header(5.0),
              ],
            );
          }
        }),
      ),
    );
  }

  //child widgets
  Container header(var padding) {
    return Container(
      padding: EdgeInsets.all(padding),
      child: const Text('Find Your Doctor'),
    );
  }

  Container search(var padding) {
    return Container(
      height: 180,
      padding: EdgeInsets.all(padding),
      //A RenderFlex overflowed by 99920 pixels on the bottom:solution->wrap widget with SingleChildScrollView
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                autofocus: false,
                validator: (value) => validateEmail(value!),
                decoration: buildInputDecoration("SEARCH", Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container flexbox(var padding) {
    return Container(
        height:150,
        width: 320,
        alignment: Alignment.center,
        padding: EdgeInsets.all(padding),
        child: Row(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
             Text('A doctor, \n like anyone else who has \n to deal with human beings,\n each of them unique, \n cannot be a scientist;\n  he is either,like the surgeon,\n a craftsman,\n or, like the physician and\n the psychologist,\n an artist.'),
             SizedBox(width: 20.0,),
             Icon(Icons.health_and_safety,size:80,)
           ],
        ),
    );
  }
}
