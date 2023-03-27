import 'package:dio/dio.dart';

import 'package:film/shared/global_endpoint.dart';

class DioService{

  final dio = Dio(BaseOptions(
    baseUrl: baseUrlApi,
    // receiveDataWhenStatusError: true,
  ));

  Future<dynamic> getDio({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? queryBody,
    String? headerAccept,
    String? headerContentType,
  }) async {
     dio.options.headers = {
      "Content-Type" : headerContentType,
      "Accept" : headerAccept
    };
     late Response response;
     try{
      response = await dio.get(
        endpoint, 
        queryParameters: queryParameters, 
        data: queryBody,);
      Map<String, dynamic> map = response.data;
      Map<String, dynamic> responseJson = map['result'];
      return responseJson;
     }  catch(e) {
      return 'error';
     }
  }

  Future<dynamic> postDio({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? queryBody,
    String? headerAccept,
    String? headerContentType,
  }) async {
    dio.options.headers = {
      "Content-Type" : headerContentType,
      "Accept" : headerAccept,
    };
    late Response response;
    try{
      response = await dio.post(
        endPoint, 
        data: queryBody, 
        queryParameters: queryParameters);
      Map<String, dynamic> map = response.data;
      var responseJson = map['result'];  
      return responseJson;
    } catch(e){
      return 'error';
    }
  }










}