import 'package:flutter/foundation.dart';
import 'package:places/type_place.dart';

///Модель для добавления фотографий в карточку места
class SightListScreenModel extends ChangeNotifier {
  ///Управление кнопкой создать
  void updateSightList() {
    debugPrint('SightListScreenModel');
    notifyListeners();
  }
}
