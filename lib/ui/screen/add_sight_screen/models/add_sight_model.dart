import 'package:flutter/material.dart';

/*
Модель для добавления фотографий в карточку места
*/
class AddSightModel extends ChangeNotifier {
  // Первое значение бронируем,
  // так как это будет кнопка "Добавить", которую удалять нельзя
  static List<String> tempPhotoPlace = ['Кнопка Добаить'];

  //Добавляем фотографию
  void AddPhoto(String pathPhoto) {
    print('tempPhotoPlace.add');
    tempPhotoPlace.add(pathPhoto);
    notifyListeners();
  }

  //Удаляем фотографию
  void DeletePhoto(int index) {
    if (index == 0) return; //Не удаляем кнопку добавить
    tempPhotoPlace.removeAt(index);
    notifyListeners();
  }
}
