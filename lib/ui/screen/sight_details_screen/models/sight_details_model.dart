import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';

///Модель для SightDetails
///

class SightDetailsModel extends ChangeNotifier {
  ///Всего отображаемых фотографий
  static int countElements = 1;

  ///Индекс отображаемой фотографии
  static int index = 0;

  Place? placeDetails;

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
    placeDetails = await PlaceInteractor.getPlaceDetails(placeId);
  }
}
