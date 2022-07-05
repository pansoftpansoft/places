import 'package:dio/dio.dart';
import 'package:places/main.dart';
import 'package:places/ui/res/route_name.dart';

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

  static void showErrorScreen() {
    navigatorKey.currentState!.pushReplacementNamed(RouteName.errorScreen);
  }
}
