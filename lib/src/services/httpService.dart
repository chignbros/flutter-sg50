import 'package:dio/dio.dart';
import 'package:sg50/src/model/company.dart';
import 'package:sg50/src/utils/http_url.dart';

class HttpService{
  final dio = Dio(
    BaseOptions(
      baseUrl: HttpUrls.baseUrl,
      headers: {
         "X-API-KEY": HttpUrls.apiKey,
      }
    ),
  );
  Future<List<CompanyModel>> getApi() async{
    final response = await dio.get(HttpUrls.getCompanies);
    if(response.statusCode==200){
      List<CompanyModel> companies = [];
      for (var json in response.data['data']) {
        companies.add(CompanyModel.fromJson(json));
      }
      return companies;
    }
    throw response.statusCode;
  }
}