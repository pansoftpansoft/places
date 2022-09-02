import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:places/data/api/api_urls.dart';


class ApiClient {
  /// Статическая настройка сервера
  static final BaseOptions _baseOptionsBackendServer = BaseOptions(
    baseUrl: urlServerBackend,
    connectTimeout: 10000,
    receiveTimeout: 10000,
    sendTimeout: 10000,
  );

  static final Dio _dio = Dio(_baseOptionsBackendServer);

  /// Сделать запрос GET на сервер
  Future<Response<dynamic>> get(String url) {
    //initInterceptors();

    return _dio.get<dynamic>(url);
  }

  /// Сделать запрос POST на сервер
  Future<Response> post(String url, String json) async {
    debugPrint('json = ${json}');
    final response = await _dio.post<dynamic>(url, data: json);
    debugPrint('response = ${response.data.toString()}');

    return response;
  }

  /// Удалить место на сервере
  Future<Response> delete(String url) => _dio.delete<Future<Response>>(url);

  void initInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint('onRequest ${options.data.toString()}');

          return handler.next(options); //continue
        },
        onResponse: (response, handler) {
          debugPrint('onResponse ${response.data.toString()}');

          return handler.next(response); // continue
        },
        onError: (e, handler) {
          debugPrint('onError ${e.toString()}');

          return handler.next(e); //continue
        },
      ),
    );
  }
}
