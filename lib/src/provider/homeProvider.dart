import 'package:flutter/material.dart';
import 'package:sg50/src/model/company.dart';
import 'package:sg50/src/services/httpService.dart';

class HomeProvider extends ChangeNotifier{
  final httpService = HttpService();
  HomeProvider(){
    init();
  }

  List<CompanyModel> companiesImg = [];

  init()async{
    final companies = await httpService.getApi();
    for(var company in companies){
      companiesImg.add(company);
    }
    notifyListeners();
  }

  Future<void> refresh(){
    return httpService.getApi().then((_user){
      httpService.getApi();
      notifyListeners();
    });
  }
}