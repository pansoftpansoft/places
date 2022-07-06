import 'package:dio/dio.dart';
import 'package:places/ui/screen/list_places_screen/models/list_places_screen_model.dart';

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
    ListPlacesScreenModel.streamControllerListPlace.addError(NetworkException);
  }
}
