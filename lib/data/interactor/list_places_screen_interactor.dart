import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/filter_distance.dart';
import 'package:places/data/model/filter_set.dart';
import 'package:places/data/model/place.dart';

class ListPlacesScreenInteractor extends ChangeNotifier {
  final FiltersScreenInteractor _filtersScreenInteractor =
      FiltersScreenInteractor();

  final PlaceInteractor _placeInteractor = PlaceInteractor();

  Future<List<Place>> loadListPlaces(
    FilterSet filterSet,
  ) async {
    FilterDistance? filterDistance;
    List<String>? listCategory = [];

    final listFilterCategory =
        await _filtersScreenInteractor.getSettingsFilterCategory();

    if (listFilterCategory.isNotEmpty) {
      for (final item in listFilterCategory) {
        if (item.categoryValue == 1) {
          listCategory.add(item.category);
        }
      }
    } else {
      listCategory = null;
    }

    filterDistance = await _filtersScreenInteractor.getSettingsFilterDistance();

    final list = await _placeInteractor.getPlacesInteractor(
      radiusRange: RangeValues(
        filterDistance.distanceStart,
        filterDistance.distanceEnd,
      ),
      category: filterSet.selectedCategory.toList(),
    );

    return list;
  }
}
