import 'package:flutter/material.dart';
import 'package:sg50/src/utils/constColor.dart';

class CenterMenuItem extends StatelessWidget {
  CenterMenuItem({this.icon, this.title,this.onTap});
  final String title;
  final IconData icon;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: backgroundItemColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              icon,
              size: 50.0,
              color: mainColorbottom,
            ),
            Text(
              title,
              style: TextStyle(
                color: mainColorbottom,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
