import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/data/model/filter_set.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/type_place.dart';

class ListPlacesInteractor {
  final PlaceRepository _placeRepository;

  ListPlacesInteractor(this._placeRepository);

  Future<List<Place>> loadListPlaces(
    FilterSet filterSet,
  ) async {
    final list = await _placeRepository.getAllPlace();

    return list;
  }

  Future<Place?> getPlaceId(int placeId) async {
    final place = await _placeRepository.getPlaceId(placeId);

    return place;
  }

  /// Получить список отфильтрованных мест
  Future<List<Place>> getPlacesInteractor({
    FilterSet? filterSet,
    String? searchString,
  }) async {
    final mocksFromRepository = await _placeRepository.getPlacesRepository(
      filterSet: filterSet,
      searchString: searchString,
    );
    mocksFiltered = mocksFromRepository;
    debugPrint('Загрузку mocksFiltered завершене = ${mocksFiltered.length}');

    return mocksFiltered;
  }
}
