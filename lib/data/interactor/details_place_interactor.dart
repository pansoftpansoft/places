import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/svg_icons.dart';

///Модель для DetailsPlaceModel
class DetailsPlaceInteractor extends ChangeNotifier {
  PlaceInteractor placeInteractor = PlaceInteractor();

  ///Индекс отображаемой фотографии
  int index = 0;

  List<String> iconList = <String>[
    SvgIcons.heartTransparent,
    SvgIcons.heartFull,
    SvgIcons.loaderSmall,
  ];

  Place? detailsPlace;

  ///Изменнение положения индикатора
  void changeScrollIndicator(
    final int indexIndicator,
  ) {
    index = indexIndicator;
  }

  Future<Place?> getPlace(
    int placeId,
  ) async {
    detailsPlace = await placeInteractor.getPlaceDetails(
      placeId,
    );

    return detailsPlace;
  }
}
