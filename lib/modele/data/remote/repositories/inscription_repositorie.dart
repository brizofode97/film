import 'package:dio/dio.dart';
import 'package:film/modele/data/remote/services/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../services/api_result.dart';

class InscriptionRepositorie {
  final _dioService = DioService();

  Future<dynamic> registrer({
    required String endpoint,
    required Map<String, dynamic> queryBody,
    required String headerContentType,
    required String headerAccept,
  }) async {
    ApiResult response = await _dioService.postDio(
        endPoint: endpoint,
        queryBody: queryBody,
        headerContentType: headerContentType,
        headerAccept: headerAccept);
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;

      EasyLoading.show(status: 'loading...');
    if (response is ApiSuccess) {
      print('le status du resultat ${response.statusCode}');
    }
    if (response is ApiFailure) {
      print('le message erreur ${response.message}');
    }
  }

  Future<dynamic> logger({
    required String endpoint,
    required Map<String, dynamic> queryBody,
    required String headerContentType,
    required String headerAccept,
  }) async {
    var response = await _dioService.postDio(
      endPoint: endpoint,
      queryBody: queryBody,
      headerContentType: "Application/json",
      headerAccept: "*/",
    );
    return response;
  }
}
