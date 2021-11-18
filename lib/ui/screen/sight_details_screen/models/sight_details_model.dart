import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/mocks.dart';

///Модель для SightDetails
class SightDetailsModel extends ChangeNotifier {
  ///Индекс отображаемой фотографии
  static int index = 0;

  ///Всего отображаемых фотографий
  static int countElements = tempPhotoPlace.length;

  ///Изменнение положения индикатора
  void changeScrollIndicator(
    final int _index,
    final int _countElements,
  ) {
    countElements = _countElements;
    index = _index;
    notifyListeners();
  }
}
