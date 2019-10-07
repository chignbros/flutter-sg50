import 'package:dio/dio.dart';
import 'package:sg50/src/model/newsmodel.dart';
import 'package:sg50/src/utils/http_url.dart';

class NewsService{
  final dio = Dio(
    BaseOptions(
      baseUrl: HttpUrls.baseUrl,
      headers: {
        "X-API-KEY": HttpUrls.apiKey,
      }
    ),
  );
  Future<List<NewsModel>> getNews()async{
    final response = await dio.get(HttpUrls.getNews);
    if(response.statusCode==200){
      List<NewsModel> news = [];
      for (var json in response.data['data']) {
        news.add(NewsModel.fromJson(json));
      }
      return news;
    }
    throw response.statusCode;
  }
}