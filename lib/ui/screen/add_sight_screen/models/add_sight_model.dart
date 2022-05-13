import 'package:flutter/foundation.dart';
import 'package:places/type_place.dart';

///Модель для добавления фотографий в карточку места
class AddSightModel extends ChangeNotifier {
  /// Первое значение бронируем,
  /// так как это будет кнопка "Добавить", которую удалять нельзя
  TypePlace? selectTypePlace;

  String? disableButton;

  ///Добавляем фотографию
  void addPhoto(final String pathPhoto) {
    debugPrint('tempPhotoPlace.add');
    //TODO сделать добавление фотографий
    //tempPhotoPlace.add(pathPhoto);
    notifyListeners();
  }

  ///Удаляем фотографию
  void deletePhoto(final int index) {
    if (index == 0) {
      return;
    } //Не удаляем кнопку добавить

    //TODO сделать удаление фотографий
    // if (tempPhotoPlace.length == 1) {
    //   return;
    // } //Не удаляем кнопку добавить
    //
    // if (index > tempPhotoPlace.length - 1) {
    //   tempPhotoPlace.removeLast();
    // } else {
    //   tempPhotoPlace.removeAt(index);
    // }
    notifyListeners();
  }

  ///
  void selectCategory(final TypePlace? changeSelect) {
    selectTypePlace = changeSelect;
    notifyListeners();
  }

  ///Управление кнопкой создать
  void disableButtonCreate(final String value) {
    disableButton = value.isEmpty ? null : value;
    notifyListeners();
  }
}
