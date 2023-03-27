abstract class ApiResult {}

class ApiSuccess extends ApiResult {
  int statusCode;
  dynamic data;

  ApiSuccess({required this.statusCode, required this.data});
}

class ApiFailure extends ApiResult {
  String message;

  ApiFailure({required this.message});
}
