import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/res/url.dart';
import 'package:places/ui/res/url_path.dart';

final dio = Dio(baseOptions);

BaseOptions baseOptions = BaseOptions(
  baseUrl: urlTestServer,
  connectTimeout: 5000,
  receiveTimeout: 5000,
  sendTimeout: 5000,
);

class DioDemoConnect {
  void getPostString() {
    final postResponse = getPost();
    debugPrint(postResponse.toString());
  }

  Future<Response<List<dynamic>?>> getPost() async {
    //initInterceptors();
    final postResponse = await dio.get<List<dynamic>?>(jsonPlaceholderUsers);
    //debugPrint(postResponse.realUri.toString());
    //debugPrint(postResponse.statusCode.toString());
    // if (postResponse.statusCode == 200) {
    //   debugPrint(postResponse.data.toString());
    // } else {
    //   debugPrint(postResponse.statusCode.toString());
    // }

    return postResponse;
  }
}

void initInterceptors() {
  dio.interceptors.add(
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
