import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/mocks.dart';

//Модель для Visiting
class VisitingModel extends ChangeNotifier {
  //Удаление из мест которые хотел посетить
  void DeletePlaceWantVisit(String name) {
    mocksWantVisit.removeWhere((element) => element.name == name);
    notifyListeners();
  }
  //Удаление из мест которые уже посетил
  void DeletePlaceVisited(String name) {
    mocksVisited.removeWhere((element) => element.name == name);
    notifyListeners();
  }
}
