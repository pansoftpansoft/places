import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/type_place.dart';

///Модель для SightDetails
class SightDetailsModel extends ChangeNotifier {
  ///Индекс отображаемой фотографии
  static int index = 0;

  ///Всего отображаемых фотографий
  static int countElements = tempPhotoPlace.length;

  ///Изменнение положения индикатора
  void changeScrollIndicator(
    final int _index,
  ) {
    countElements = tempPhotoPlace.length;
    index = _index;
    notifyListeners();
  }
}
