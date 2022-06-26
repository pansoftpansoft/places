import 'package:flutter/foundation.dart';

///Модель для добавления фотографий в карточку места
class ListPlacesScreenModel extends ChangeNotifier {
  ///Управление кнопкой создать
  void updatePlacesList() {
    debugPrint('PlacesListScreenModel');
    notifyListeners();
  }
}
