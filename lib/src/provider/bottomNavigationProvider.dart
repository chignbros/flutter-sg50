import 'package:flutter/material.dart';

class BottomNavigationBarProvider extends ChangeNotifier{
  int _currentIndex = 0;
  get getcurrentIndex => _currentIndex;
  set setcurrentIndex (int index){
    _currentIndex = index;
    notifyListeners();
  }
}