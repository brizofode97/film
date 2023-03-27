import 'package:dio/dio.dart';
import 'package:film/modele/data/remote/services/dio_service.dart';

import '../services/api_result.dart';

class InscriptionRepositorie {
  final _dioService = DioService();

  Future<dynamic> registrer({
    required String endpoint,
    required Map<String, dynamic> queryBody,
    required String headerContentType,
    required String headerAccept,
  }) async {
    var response = await _dioService.postDio(
        endPoint: endpoint,
        queryBody: queryBody,
        headerContentType: headerContentType,
        headerAccept: headerAccept);
    if (response == ApiSuccess) {
      print('le status du resultat ${response.data['httpStatusCode']}');
    }
    if (response == ApiFailure) {
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
