import 'package:dio/dio.dart';

class ApiClient{
  Dio dio=Dio();
  Future<Response>getSearchResult()async{

    final result=  await dio.get("https://www.googleapis.com/youtube/v3/search?part=id,snippet&maxResults=50&channelId=UCVMWWQ985A_-SESZUy_SsVQ&key=AIzaSyAityvKSb8_MZFnq9cuKOniroFkkA-L_SE");
 print(result);
 return result;
  }
}