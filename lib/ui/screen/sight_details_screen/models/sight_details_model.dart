import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///Модель для SightDetails
class SightDetailsModel extends ChangeNotifier {
  ///Индекс отображаемой фотографии
  static int index = 0;

  ///Всего отображаемых фотографий
  static int countElements = 1;

  ///Изменнение положения индикатора
  void changeScrollIndicator(
    final int countPhoto,
    final int indexIndicator,
  ) {
    debugPrint('notifyListeners()');
    countElements = countPhoto;
    index = indexIndicator;
  }

  void updateScrollIndicator(
      ) {
    notifyListeners();
  }
}
