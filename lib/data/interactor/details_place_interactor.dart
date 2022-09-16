import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:provider/provider.dart';

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
    debugPrint('notifyListeners()');
    index = indexIndicator;
  }

  void updateScreen() {
    notifyListeners();
  }

  Future<void> getPlace(
    int placeId,
    StreamController<Place> streamControllerListPlace,
  ) async {
    detailsPlace = await placeInteractor.getPlaceDetails(
      placeId,
      streamControllerListPlace,
    );
  }
}
