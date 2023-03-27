import 'dart:io';

import 'package:dio/dio.dart';
import 'package:film/modele/data/remote/services/api_result.dart';

import 'package:film/shared/global_endpoint.dart';

class DioService {
  final dio = Dio(BaseOptions(
    baseUrl: baseUrlApi,
    receiveDataWhenStatusError: true,
  ));

  Future<dynamic> getDio({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? queryBody,
    String? headerAccept,
    String? headerContentType,
  }) async {
    dio.options.headers = {
      "Content-Type": headerContentType,
      "Accept": headerAccept
    };
    late Response response;
    try {
      response = await dio.get(
        endpoint,
        queryParameters: queryParameters,
        data: queryBody,
      );
      Map<String, dynamic> map = response.data;
      Map<String, dynamic> responseJson = map['result'];
      ApiSuccess success = ApiSuccess(statusCode: 200, data: responseJson);
      return success;
    } on SocketException {
      return ApiFailure(message: 'No connect Socket');
    } on FormatException {
      return ApiFailure(message: 'Format Exception');
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        return ApiFailure(message: e.message.toString());
      } else {
        return ApiFailure(message: 'Connect timeout');
      }
    } catch (e) {
      return ApiFailure(message: 'error inconnue');
    }
  }

  Future<dynamic> postDio({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? queryBody,
    String? headerContentType,
    String? headerAccept,
  }) async {
    dio.options.headers = {
      "Content-Type": headerContentType,
      "Accept": headerAccept,
    };
    try {
      Response response = await dio.post(endPoint,
          data: queryBody, queryParameters: queryParameters);
      Map<String, dynamic> map = response.data;
      var responseJson = map['result'];
      ApiSuccess success = ApiSuccess(statusCode: 200, data: responseJson);
      print('test : ${responseJson['httpStatuscode']}');
      return success;
    } on SocketException {
      return ApiFailure(message: 'No Socket Exception');
    } on FormatException {
      return ApiFailure(message: 'No format Exception');
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        return ApiFailure(message: e.message.toString());
      } else {
        ApiFailure(message: 'connection timeout');
      }
    } catch (e) {
      return ApiFailure(message: 'error');
    }
  }
}
