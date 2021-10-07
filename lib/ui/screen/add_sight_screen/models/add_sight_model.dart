import 'package:flutter/foundation.dart';

///Модель для добавления фотографий в карточку места
class AddSightModel extends ChangeNotifier {
  /// Первое значение бронируем,
  /// так как это будет кнопка "Добавить", которую удалять нельзя
  static List<String> tempPhotoPlace = <String>['Кнопка Добаить'];

  ///Добавляем фотографию
  void addPhoto(final String pathPhoto) {
    if (kDebugMode) {
      print('tempPhotoPlace.add');
    }
    tempPhotoPlace.add(pathPhoto);
    notifyListeners();
  }

  ///Удаляем фотографию
  void deletePhoto(final int index) {
    if (index == 0) {
      return;
    } //Не удаляем кнопку добавить
    tempPhotoPlace.removeAt(index);
    notifyListeners();
  }
}
