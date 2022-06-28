import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:places/data/api/api_urls.dart';



final dio = Dio(baseOptions);

BaseOptions baseOptions = BaseOptions(
  baseUrl: urlServerBackend,
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
    final postResponse = await dio.get<List<dynamic>?>(pathUrlListPlaces);
    //debugPrint(postResponse.realUri.toString());
    //debugPrint(postResponse.statusCode.toString());
    // if (postResponse.statusCode == 200) {
    //   debugPrint(postResponse.data.toString());
    // } else {
    //   debugPrint(postResponse.statusCode.toString());
    // }

    return postResponse;
  }

  // Future<Response<List<dynamic>?>> getPostDto() async {
  //   //initInterceptors();
  //   final dynamic filter = PlaceRepository.createFilter();
  //
  //   debugPrint('filter = $filter');
  //   final postResponse = await dio.post<List<dynamic>?>(
  //     pathUrlFilteredPlaces,
  //     data: filter,
  //   );
  //
  //   //debugPrint(postResponse.realUri.toString());
  //   //debugPrint(postResponse.statusCode.toString());
  //   // if (postResponse.statusCode == 200) {
  //   //   debugPrint(postResponse.data.toString());
  //   // } else {
  //   //   debugPrint(postResponse.statusCode.toString());
  //   // }
  //
  //   return postResponse;
  // }
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
