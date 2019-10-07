import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sg50/src/utils/sg_icons.dart';

import 'centerMenuItem.dart';

class CenterMenu extends StatelessWidget {
  CenterMenu({this.height,this.width});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
      width: width,
      height: height,
      child: GridView.count(
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        primary: false,
        childAspectRatio: width/height,
        crossAxisCount: 2,
        children: <Widget>[
          CenterMenuItem(
            onTap: (){
              Navigator.pushNamed(context, 'bookingappointment');
            },
            title: 'Booking Appointment',
            icon: SgIcons.stethoscope,
          ),
          CenterMenuItem(
            title: 'Re-Fill Medication',
            icon: SgIcons.pill,
          ),
          CenterMenuItem(
            title: 'Health CheckUp Package',
            icon: FontAwesomeIcons.heartbeat,
          ),
          CenterMenuItem(
            title: 'Contact US',
            icon: SgIcons.people,
          ),
        ],
      ),
    );
  }
}
