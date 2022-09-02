import 'package:flutter/foundation.dart';

///Модель для добавления фотографий в карточку места
class AddPlaceInteractor extends ChangeNotifier {
  /// Первое значение бронируем,
  /// так как это будет кнопка "Добавить", которую удалять нельзя
  String? selectTypePlace;

  String? disableButton;

  ///Добавляем фотографию
  void addPhoto(
    String pathPhoto,
  ) {
    debugPrint('tempPhotoPlace.add $pathPhoto');

    //tempPhotoPlace.add(pathPhoto);
    notifyListeners();
  }

  ///Удаляем фотографию
  void deletePhoto(int index) {
    if (index == 0) {
      return;
    } //Не удаляем кнопку добавить

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
  void selectCategory(String? changeSelect) {
    selectTypePlace = changeSelect;
    notifyListeners();
  }

  ///Управление кнопкой создать
  void disableButtonCreate(String value) {
    disableButton = value.isEmpty ? null : value;
  }
}
