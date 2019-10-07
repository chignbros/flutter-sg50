import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:sg50/src/utils/constColor.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:sg50/src/utils/sg_icons.dart';
import 'package:intl/intl.dart';

enum Hospital { bum, vl }

class BookingAppointment extends StatefulWidget {
  @override
  _BookingAppointmentState createState() => _BookingAppointmentState();
}

class _BookingAppointmentState extends State<BookingAppointment> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Male';
  Hospital selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text('Booking Appointment'),
        backgroundColorStart: mainColor,
        backgroundColorEnd: mainColorbottom,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                mainColor,
                mainColorbottom,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = Hospital.bum;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: selected == Hospital.bum
                              ? Colors.white
                              : backgroundItemColor,
                        ),
                        height: 100.0,
                        width: 150.0,
                        child: Image.asset(
                          'images/Bum.png',
                          width: 130,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = Hospital.vl;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: selected == Hospital.vl
                              ? Colors.white
                              : backgroundItemColor,
                        ),
                        height: 100.0,
                        width: 150.0,
                        child: Image.asset('images/VL.png', width: 130),
                      ),
                    ),
                  ],
                ),
                TextHeader(
                  title: 'Fist name',
                  isRequired: true,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter first name",
                    prefixIcon: Icon(SgIcons.people),
                  ),
                ),
                TextHeader(
                  title: 'Last name',
                  isRequired: true,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(SgIcons.people),
                    hintText: "Enter last name",
                  ),
                ),
                TextHeader(
                  title: 'Gender',
                  isRequired: true,
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: mainColorbottom,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Male', 'Female']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
                TextHeader(
                  title: 'Date of Birth',
                  isRequired: true,
                ),
                BasicDateField(),
                TextHeader(
                  title: 'Phone number',
                  isRequired: true,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter phone number",
                    prefixIcon: Icon(Icons.phone_in_talk),
                  ),
                ),
                TextHeader(title: 'Hospital number (HN)'),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter hospital number",
                    prefixIcon: Icon(Icons.local_hospital),
                  ),
                ),
                TextHeader(title: 'Email'),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter email address",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                Text(
                  'Information',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'What is your ill?',
                  style: TextStyle(color: Colors.white),
                ),
                TextFormField(
                  //keyboardType:,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.menu),
                    suffixIcon: Icon(Icons.chevron_right),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, 'illScreen');
                  },
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 10.0, 5.0, 10.0),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.circular(10.0),
                        ),
                        child: Center(
                          child: Text('Cancel'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5.0, 10.0, 0, 10.0),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.circular(10.0),
                        ),
                        child: Center(
                            child: Text(
                          'Submit',
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DateTimeField(
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.calendar_today),
        ),
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}

class TextHeader extends StatelessWidget {
  TextHeader({this.title, this.isRequired = false});
  final String title;

  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        if (isRequired)
          Text(
            "*",
            style: TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}
