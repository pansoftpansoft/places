import 'package:dio/dio.dart';
import 'package:places/ui/res/url.dart';

class ConnectionBackendServer {
  /// Статическая настройка сервера
  static final BaseOptions _baseOptionsBackendServer = BaseOptions(
    baseUrl: urlServerBackend,
    connectTimeout: 10000,
    receiveTimeout: 10000,
    sendTimeout: 10000,
  );

  static final Dio _dio = Dio(_baseOptionsBackendServer);

  Future<Response<dynamic>> get(String url) =>
      _dio.get<dynamic>(url);

  /// добавить новое место на сервер
  Future<Response> post(String url, String json) =>
      _dio.post<Future<Response>>(url, data: json);

  /// удалить место на сервере
  Future<Response> delete(String url) => _dio.delete<Future<Response>>(url);
}
