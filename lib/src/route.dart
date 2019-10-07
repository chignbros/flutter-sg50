import 'package:flutter/material.dart';
import 'package:sg50/src/screens/bannerDetail.dart';
import 'package:sg50/src/screens/bookingAppointment.dart';
import 'package:sg50/src/screens/chooseIll.dart';
import 'package:sg50/src/screens/index.dart';
import 'package:sg50/src/screens/newDetail.dart';

Route<dynamic> generateRoute (RouteSettings settings){
  final  args = settings.arguments;
  switch(settings.name){
    case '/':
      return MaterialPageRoute(builder: (context)=>IndexScreen());
    case 'bannerDetail':
      return MaterialPageRoute(builder: (context)=>BannerDetail(company: args,));
    case 'newsDetail':
      return MaterialPageRoute(builder: (context)=>NewDetail(newsModel: args,));
    case 'bookingappointment':
      return MaterialPageRoute(builder: (context)=>BookingAppointment());
    case 'illScreen':
      return MaterialPageRoute(builder: (context)=>IllScreen());
  }
}