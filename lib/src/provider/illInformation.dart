import 'package:flutter/material.dart';
import 'package:sg50/src/model/IllModel.dart';
import 'package:sg50/src/services/GetIllService.dart';

class IllProvider extends ChangeNotifier{
  final ills = IllService();
  IllProvider(){
    init();
  }
  List<IllModel> illData = [];
  init() async{
    final getIlls = await ills.getIll();
    for (var ills in getIlls) {
      illData.add(ills);
    }
    notifyListeners();
  }
}