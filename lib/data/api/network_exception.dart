import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String urlString;
  final String textError;
  final int? codeError;

  NetworkException(DioError error)
      : urlString =
            '${error.requestOptions.baseUrl}${error.requestOptions.path}',
        textError = error.message,
        codeError = error.response?.statusCode;

  @override
  String toString() {
    return 'В запросе $urlString возникла ошибка:'
        '${codeError == null ? '' : ' $codeError'} $textError';
  }
}
