import 'package:dio/dio.dart';
import 'package:sg50/src/model/IllModel.dart';
import 'package:sg50/src/utils/http_url.dart';

class IllService{
  final dio = Dio(
    BaseOptions(
      baseUrl: HttpUrls.baseUrl,
      headers: {
        "X-API-KEY":HttpUrls.apiKey,
      }
    ),
  );
  Future<List<IllModel>> getIll() async{
    final response = await dio.get(HttpUrls.getIll);
    if(response.statusCode==200){
      List<IllModel> ills = [];
      for (var json in response.data['data']) {
        ills.add(IllModel.fromJson(json));
      }
      return ills;
    }
    throw response.statusCode;
  }
}