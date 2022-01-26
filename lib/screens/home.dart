// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:doctor_appointment_booking/classes/doctor.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //Top rated doctors
    List<Doctor> doctors = [];
    doctors.add(Doctor(name: 'Kevin White', specialty: 'Cardiologist'));
    doctors.add(Doctor(name: 'Jake Pini', specialty: 'Dermatologist'));
    doctors.add(Doctor(name: 'Maya Angie', specialty: 'Pediatrician'));
    doctors.add(Doctor(name: 'Maya Angie', specialty: 'Pediatrician'));

    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        
        if (orientation == Orientation.portrait) {
          //potrait
          return Scaffold(
            appBar: customAppBar(),
            bottomNavigationBar: customBottomNavigationBar(),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    customTopText(),
                    SizedBox(
                      height: 10.0,
                    ),
                    customSearchSizedBox(),
                    SizedBox(
                      height: 10.0,
                    ),
                    customCardContainer(),
                    SizedBox(
                      height: 10.0,
                    ),
                    customMiddleText(),
                    SizedBox(
                      height: 5.0,
                    ),
                    customListSizedBox(doctors),
                  ],
                ),
              ),
            ),
          );
        } else {
          //landscape
          return Scaffold(
            appBar: customAppBar(),
            bottomNavigationBar: customBottomNavigationBar(),
            body: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                        customTopText(),
                        SizedBox(height: 10.0,),
                        customSearchSizedBox(),
                        SizedBox(height: 10.0,),
                        customCardContainer(),
                        SizedBox(height: 120.0,),
                      ],),
                    ),
                    SizedBox(width: 20.0,),
                    SizedBox(
                      child: Column(
                        children: [
                          SizedBox(height: 10.0,),
                          SizedBox(
                            child: customMiddleText(),
                          ),
                          SizedBox(height:10.0),
                          customListSizedBox(doctors),
                      
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  //child widgets
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
        'Doc\'s Appointment',
        style: TextStyle(fontSize: 15.0),
      ),
      actions: [
        IconButton(onPressed: () {
          Navigator.pushReplacementNamed(context, '/login');
          //Navigator.pop(context)
        }, icon: Icon(Icons.person)),
        SizedBox(
          width: 20.0,
        )
      ],
    );
  }

  //customBottomNavigationBar
  BottomNavigationBar customBottomNavigationBar() {
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
          icon: Icon(Icons.healing_outlined),
          label: 'Doctors',
        ),
      ],
      onTap: (selectedIndex) {
        if(selectedIndex == 1){
          Navigator.pushReplacementNamed(context, '/doctors');
        }
      },
    );
  }

  //customTopText
  Text customTopText() {
    return Text(
      'Find Your Doctor Here',
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
    );
  }

//customSearchSizedBox
  SizedBox customSearchSizedBox() {
    return SizedBox(
      width: 300.0,
      child: Form(
          child: Row(
        children: [
          SizedBox(
              width: 240.0,
              child: TextFormField(
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
                decoration: InputDecoration(
                    labelText: "search",
                    labelStyle: TextStyle(
                      color: Colors.pinkAccent,
                    ),
                    border: OutlineInputBorder()),
              )),
          SizedBox(width: 0.0),
          SizedBox(
            width: 60.0,
            child: MaterialButton(
              onPressed: () {},
              textColor: Colors.white,
              color: Colors.pinkAccent,
              child: SizedBox(
                width: double.infinity,
                child: Icon(Icons.search),
              ),
              height: 60.0,
              minWidth: 60.0,
            ),
          ),
        ],
      )),
    );
  }

//customCardContainer
  Container customCardContainer() {
    return Container(
      width: 305,
      height: 100,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              offset: Offset(0.0, 5.0),
            ),
          ]),
      child: Row(
        children: [
          Text(
            'Check in with us \nRegularly to \nProlong you health',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 80.0,
          ),
          Icon(
            Icons.health_and_safety,
            size: 60.0,
            color: Colors.white,
          )
        ],
      ),
    );
  }

//customMiddleText
  Text customMiddleText() {
    return Text(
      'top rated doctors',
      style: TextStyle(
        fontSize: 12.0,
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.start,
    );
  }

  SizedBox customListSizedBox(List doctors) {
    return SizedBox(
      width: 320.0,
      height: 300.0,
      child: ListView.builder(
          itemCount: doctors.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.person_outline),
                title: Text(doctors[index].name),
                subtitle: Text(doctors[index].specialty),
                onTap: () {
                    Navigator.pushReplacementNamed(context, '/doctordetails');
                },
              ),
            );
          }),
    );
  }
}
