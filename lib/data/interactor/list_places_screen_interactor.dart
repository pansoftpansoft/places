import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/filter_set.dart';
import 'package:places/data/model/place.dart';

class ListPlacesScreenInteractor extends ChangeNotifier {
  final PlaceInteractor _placeInteractor = PlaceInteractor();

  Future<List<Place>> loadListPlaces(
    FilterSet filterSet,
  ) async {
    final list = await _placeInteractor.getPlacesInteractor(
      filterSet: filterSet,
    );

    return list;
  }
}
