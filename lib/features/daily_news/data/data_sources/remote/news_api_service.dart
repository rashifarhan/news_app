import 'package:news_app/core/constants/constants.dart';

import 'package:dio/dio.dart';



class NewsApiService{
  final Dio dio;

  NewsApiService({required this.dio});

   getNewsArticle({required String country,required String category,required String apiKey})async{
     Response response =await dio.get("$newsAPIBaseUrl$type?country=$country&category=$category&apiKey=$apiKey");
     return response;
     //print(response.data);
  

  

}
}