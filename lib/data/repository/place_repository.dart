import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/data/connection_backend_server.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/place_filter_request_dto.dart';
import 'package:places/ui/res/url_path.dart';

int iii = 0;

class PlaceRepository {
  static final ConnectionBackendServer _server = ConnectionBackendServer();

  /// Создать новое место на сервере
  static Future<Response> postPlace(Place place) async {
    return _server.post(
      pathUrlCreatePlace,
      place.toJson().toString(),
    );
  }

  /// Получаем список всех мест
  static Future<List<Place>> getPlace() async {
    return ((await _server.get(pathUrlListPlaces)).data as List)
        // ignore: avoid_annotating_with_dynamic
        .map<Place>((dynamic e) => Place.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Получаем список отфильтрованных мест мест
  static Future<List<Place>> postPlaceDto() async {
    // Создаем фильтр
    final dynamic filterJson = createFilter();

    final response = await _server.post(pathUrlListPlaces, filterJson) as List;
    final places = response
        // ignore: avoid_annotating_with_dynamic
        .map<Place>((dynamic e) => Place.fromJson(e as Map<String, dynamic>))
        .toList();

    /// Данные пользователя
    return places;
  }

  /// Получить место по идентификатору
  static Future<Place> getPlaceId(int placeId) async {
    String mapString;
    iii++;
    debugPrint(iii.toString());
    final response = await _server.get('$pathUrlListPlaces/$placeId');

    mapString = response.toString();

    final mapFull = json.decode(mapString) as Map<String, dynamic>;

    return Place.fromJson(mapFull);
  }

  /// Создаем фильтр
  static dynamic createFilter() {
    const lat = 0.0;
    const lon = 0.0;
    const radius = 0.0;
    final typeFilter = <String>[];
    const nameFilter = '';

    final dynamic filterJson = PlaceFilterRequestDto(
      lat: lat,
      lon: lon,
      radius: radius,
      typeFilter: typeFilter,
      nameFilter: nameFilter,
    ).toJson();

    return filterJson;
  }

  /// Удалить место на сервере
  Future<Response> deletePlace(Place place) async {
    return _server.delete(
      '$pathUrlDeletePlace/${place.id.toString()}',
    );
  }

  /// Обновить данные о месте и олучить место по идентификатору
  Future<Place> putPlace(Place place) async {
    return Place.fromJson(
      await _server.get('$pathUrlPutPlace/${place.id.toString()}')
          as Map<String, dynamic>,
    );
  }
}
