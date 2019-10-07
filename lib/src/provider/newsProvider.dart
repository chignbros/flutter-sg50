import 'package:flutter/material.dart';
import 'package:sg50/src/model/newsmodel.dart';
import 'package:sg50/src/services/newService.dart';

class NewsProvider extends ChangeNotifier{
  final newsService = NewsService();
  NewsProvider(){
    init();
  }

  List<NewsModel> newsData = [];
  
  init() async{
    final news = await newsService.getNews();
    for (var newsdata in news) {
      newsData.add(newsdata);
    }
    notifyListeners();
  }
}