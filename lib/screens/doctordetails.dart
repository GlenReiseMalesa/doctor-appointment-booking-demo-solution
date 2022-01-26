// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({Key? key}) : super(key: key);

  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  //Intent info from the previous page
  final String _DocName = 'John Doe';
  final String _DocSpecialty = 'Cardiologist';
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();

    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return Scaffold(
            appBar: customAppBar(),
            body: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    customDoctorImg(),
                    SizedBox(height: 20.0),
                    customDocName(_DocName),
                    SizedBox(height: 2.0),
                    customDocSpeciality(_DocSpecialty),
                    SizedBox(
                      height: DBLNewHeight(0.15),
                    ),
                    customBookingCard(),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: customAppBar(),
            body: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SizedBox(
                      width: DBLNewWidth(0.5),
                      height: DBLNewHeight(1),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          customDoctorImg(),
                          SizedBox(height: 50.0),
                          customDocName(_DocName),
                          SizedBox(height: 2.0),
                          customDocSpeciality(_DocSpecialty),                          
                        ],
                      ),
                    ),
                    SizedBox(
                      width: DBLNewWidth(0.5),
                      height: DBLNewHeight(1),
                      child:customBookingCard(),                      
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
        'Doctor Profile',
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

  //customDoctorImg
  SizedBox customDoctorImg() {
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

  //customDocName
  Text customDocName(String name) {
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

  //customDocSpeciality
  Text customDocSpeciality(String specialty) {
    return Text(
      specialty,
      style: TextStyle(
        fontSize: DBLNewSize(0.03),
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.start,
    );
  }

  //Calender popup
  Future<DateTime> _selectDate(DateTime selectedDate) async {
    DateTime _initialDate = selectedDate;
    final DateTime? _pickedDate = await showDatePicker(
      context: context,
      initialDate: _initialDate,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (_pickedDate != null) {
      selectedDate = DateTime(
          _pickedDate.year,
          _pickedDate.month,
          _pickedDate.day,
          _initialDate.hour,
          _initialDate.minute,
          _initialDate.second,
          _initialDate.millisecond,
          _initialDate.microsecond);
    }
    return selectedDate;
  }

  //customCalenderFlatButton
  SizedBox customCalenderFlatButton() {
    return SizedBox(
      width: DBLNewWidth(0.65),
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        onPressed: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          DateTime _pickerDate = await _selectDate(_selectedDate);
          setState(() {
            _selectedDate = _pickerDate;
          });
        },
        child: Row(
          children: <Widget>[
            Icon(
              Icons.calendar_today,
              size: 22.0,
              color: Colors.black54,
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              _selectedDate.toString(),
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }

  //
  MaterialButton customBookingButton() {
    return MaterialButton(
      onPressed: () {},
      textColor: Colors.white,
      color: Colors.blueAccent,
      child:Text('book apppointment',),
      height: 70.0,
      minWidth: DBLNewWidth(0.7),
    );
  }

  //booking card
  SizedBox customBookingCard() {
    return SizedBox(
      width: DBLNewWidth(0.7),
      height: DBLNewHeight(0.2),
      child: Container(
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
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            customCalenderFlatButton(),
            SizedBox(
              height: 20.0,
            ),
            customBookingButton()
          ],
        ),
      ),
    );
  }
}
