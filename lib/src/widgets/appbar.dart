import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:sg50/src/utils/constColor.dart';

class AppbarWidget {
  AppbarWidget({this.title});
  String title;
  Widget action;
  static Widget appbar({title}){
    return GradientAppBar(
      actions: <Widget>[
        IconButton(
          onPressed: (){},
          icon: Icon(FontAwesomeIcons.bell),
        ),
        IconButton(
          onPressed: (){},
          icon: Icon(FontAwesomeIcons.user),
        ),
      ],
      centerTitle: true,
      title: Text(title),
      backgroundColorStart: mainColor,
      backgroundColorEnd: mainColorbottom,
    );
  }
}