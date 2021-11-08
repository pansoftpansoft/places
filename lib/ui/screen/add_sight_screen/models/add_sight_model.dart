import 'package:flutter/foundation.dart';
import 'package:places/mocks.dart';

///Модель для добавления фотографий в карточку места
class AddSightModel extends ChangeNotifier {
  /// Первое значение бронируем,
  /// так как это будет кнопка "Добавить", которую удалять нельзя

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

    if (tempPhotoPlace.length == 1) {
      return;
    } //Не удаляем кнопку добавить

    if (index > tempPhotoPlace.length - 1) {
      tempPhotoPlace.removeLast();
    } else {
      tempPhotoPlace.removeAt(index);
    }
    notifyListeners();
  }
}
