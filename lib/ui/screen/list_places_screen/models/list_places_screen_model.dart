import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:places/data/model/place.dart';

///Модель для добавления фотографий в карточку места
class ListPlacesScreenModel extends ChangeNotifier {
  static StreamController<Place> streamControllerListPlace =
      StreamController<Place>();

  static void openStream() {
    debugPrint('Открыть стрим');
    streamControllerListPlace = StreamController<Place>();
  }

  static void closeStream() {
    debugPrint('Закрываем стрим');
    streamControllerListPlace.close();
  }

  ///Управление кнопкой создать
  void updatePlacesList() {
    debugPrint('PlacesListScreenModel');
    notifyListeners();
  }
}
