import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/filters_screen/model/filters_screen_model.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
import 'package:provider/provider.dart';

///Модель для DetailsPlaceModel
class DetailsPlaceModel extends ChangeNotifier {
  ///Всего отображаемых фотографий
  static int countElements = 1;

  ///Индекс отображаемой фотографии
  static int index = 0;

  static List<String> iconList = <String>[
    SvgIcons.heartTransparent,
    SvgIcons.heartFull,
    SvgIcons.loaderSmall,
  ];

  static StreamController<String> streamController = StreamController<String>();

  Place? detailsPlace;

  static void openStream() {
    debugPrint('Открываем стрим');
    streamController = StreamController<String>();
  }

  static void closeStream() {
    debugPrint('Закрываем стрим');
    streamController.close();
  }

  static void updateContext(Place place, BuildContext context) {
    PlaceInteractor.setFavorites(place).then((value) {
      DetailsPlaceModel.streamController.sink.add(
        DetailsPlaceModel.iconList[place.isFavorites ? 1 : 0],
      );
      debugPrint(
        'Обновление контекстов при нажатии кнопки Добавить в фавориты',
      );
      //context.read<DetailsPlaceModel>().updateScreen();
      context.read<VisitingModel>().updateScreen();
      context.read<FiltersScreenModel>().notifyListenersFiltersScreen();
    });
  }

  static void onPressed(Place place, BuildContext context) {
    DetailsPlaceModel.streamController.sink.add(DetailsPlaceModel.iconList[2]);
    updateContext(place, context);
  }

  ///Изменнение положения индикатора
  void changeScrollIndicator(
    final int countPhoto,
    final int indexIndicator,
  ) {
    debugPrint('notifyListeners()');
    countElements = countPhoto;
    index = indexIndicator;
  }

  void updateScreen() {
    notifyListeners();
  }

  Future<void> getPlace(int placeId) async {
    detailsPlace = await PlaceInteractor.getPlaceDetails(placeId);
  }
}
