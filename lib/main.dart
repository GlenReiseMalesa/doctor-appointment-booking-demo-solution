import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      home: const Home(),
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
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 720) {
          //if it's a phone screen
          return Column(
            children: <Widget>[
              header(5.0),
              const SizedBox( height: 6.0,),
            ],
          );
        } else {
          //if it's a tablet or pc screen
          return Column(
            children: <Widget>[],
          );
        }
      }),
    );
  }

  //child widgets
  Container header(var padding) {
    return Container(
            padding: EdgeInsets.all(padding),
            child: const Text('Find Your Doctor'),
           );
  }

  Container body(var padding) {
    return Container(
            padding: EdgeInsets.all(padding),
            child: Form(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  <Widget>[
                                  const SizedBox(height: 10.0,),
                                  TextFormField(
                                    autofocus: false,
                                    validator: (value) => validateEmail(value!),
                                    decoration: buildInputDecoration("SEARCH",Icons.search),
                                  ),
                                ],
                               ),        
                   ),
           );
  }
}
