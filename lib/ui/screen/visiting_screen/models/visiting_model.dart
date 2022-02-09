import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/type_place.dart';

///Модель для Visiting
class VisitingModel extends ChangeNotifier {
  ///Удаление из мест которые хотел посетить
  void deletePlaceWantVisit(final String name) {
    mocksWantVisit.removeWhere(( final element) => element.name == name);
    notifyListeners();
  }

  ///Удаление из мест которые уже посетил
  void deletePlaceVisited(final String name) {
    mocksVisited.removeWhere((final element) => element.name == name);
    notifyListeners();
  }

  ///Перемещение карточек внутри списка
  void sortedPlaceWantVisit(final int sours, final int target) {
    final placeTarget = mocksWantVisit[target];
    mocksWantVisit[target] = mocksWantVisit[sours];
    mocksWantVisit[sours] = placeTarget;
    notifyListeners();
  }

  ///Установка или изменение даты заплонированного посещения интересног места
  void dateWantVisit(final int sours, final DateTime dateWantVisitNew) {
    mocksWantVisit[sours].wantVisitDate = dateWantVisitNew;
    notifyListeners();
  }
}
