// ignore_for_file: unnecessary_getters_setters

import 'dart:async';

//import 'dart:math';
import 'package:flutter/material.dart';
import 'package:places/domain/db_provider.dart';
import 'package:places/domain/history.dart';
import 'package:places/type_place.dart';

///Модель для поиска
class SearchScreenModel extends ChangeNotifier {
  ///Список истории поисковых запросов
  static List<History> listHistory = <History>[];


  ///
  static ScreenEnum? selectedScreen;

  ///Контроллер поля поиска
  static TextEditingController textEditingControllerFind =
      TextEditingController();

  static String _searchString = '';


  final bool _errorTest = false;



  static String get searchString => _searchString;

  ///Получаем список историй поиска
  static Future<int> getListHistory() async {
    listHistory = (await DBProvider.dbProvider.getListHistoryFromDb())!;

    return listHistory.length;
  }


  /// Получить отфильтрованный список мест
  /// И проверить на совподение со строкой поиска
  bool getFilteredList() {
    //mocksFiltered.clear();
    mocksSearchText.clear();
    if (_searchString.isNotEmpty) {
      for (final item in mocks) {
        //фильтр установлен проверяем его и поиск по имени
        debugPrint(_searchString);
        if (item.name.toLowerCase().contains(_searchString.toLowerCase())) {
          mocksFiltered.add(item);
        }
      }
    }
    debugPrint('200 mocksSearch ${mocksFiltered.length.toString()}');

    return _errorTest;
  }

  bool getSearchTextList() {
    mocksSearchText.clear();
    if (_searchString.isNotEmpty) {
      debugPrint('900 mocksSearch ${mocksFiltered.length.toString()}');
      for (final item in mocksFiltered) {
        //фильтр установлен проверяем его и поиск по имени
        debugPrint(_searchString);
        if (item.visibleFilter) {
          if (item.name
              .toLowerCase()
              .contains(_searchString.trimRight().toLowerCase())) {
            mocksSearchText.add(item);
          }
        }
      }
    }

    return _errorTest;
  }

  ///Сообщить всем что список мест изменился
  void changeSearch() {
    ///Запускаем загрузчик
    managerSelectionScreen(numberScreen: ScreenEnum.loadScreen);
    notifyListeners();
    Timer(
      const Duration(seconds: 1),
      () {
        debugPrint('300 mocksSearch ${mocksFiltered.length.toString()}');
        if (mocksFiltered.isEmpty) {
          //ошибка выдаем экран сообщения
          debugPrint('Не найдено ни одного места');
          managerSelectionScreen(numberScreen: ScreenEnum.emptyScreen);
        } else {
          debugPrint('Найдено ${mocks.length} места');
          managerSelectionScreen(
            numberScreen: ScreenEnum.listFoundPlacesScreen,
          );
        }
        debugPrint('changeSearch notifyListeners()');
        notifyListeners();
      },
    );
  }

  ///Устанавливаем строку поиска
  void setSearchText(final String searchString) {
    mocksSearchText.clear();
    if (searchString == '') {
      _searchString = '';
      SearchScreenModel.textEditingControllerFind.clear();
    } else {
      _searchString = searchString;

      SearchScreenModel.textEditingControllerFind.value = TextEditingValue(
        text: searchString,
        selection: TextSelection.fromPosition(
          TextPosition(offset: searchString.length),
        ),
      );
    }
  }

  /// поиск мест по вводимому тексту при нажатии Enter
  ///c записью запроса в историю запросов
  void searchPlaceForEnter(final String searchString) {
    //Ищем текст
    setSearchText(searchString);
    //сохранить текст поиска
    DBProvider.dbProvider.addHistory(searchString);
  }



  ///Очищаем список историй поиска
  Future<void> clearHistory() async {
    await DBProvider.dbProvider.deleteTheListOfSearchHistoryWords();
    await getListHistory(); //Обновляем список после удаления всех имторий
  }

  ///Удаляю одну запись из истории поиска
  Future<void> deleteHistory(final String historyText) async {
    await DBProvider.deleteHistory(historyText);
    await getListHistory(); //Обновляем список после удаления всей истории
    notifyListeners();
  }

  ///Здесь мы устанавливаем какой экран хотим получить и корректируем
  ///в зависимости от данных, выдавая
  ///пустые экраны или экраны с ошибкой
  Future<void> managerSelectionScreen({final ScreenEnum? numberScreen}) async {
    ///Если экран жестко задан
    debugPrint('managerSelectionScreen $numberScreen');
    if (numberScreen != null) {
      selectedScreen = numberScreen;

      /// Если найдено 0 мест то выдаем экрас с сообщением
      if (selectedScreen == ScreenEnum.listFoundPlacesScreen &&
          mocksSearchText.isEmpty) {
        debugPrint('_searchString  ${_searchString.isEmpty.toString()}');
        selectedScreen = _searchString.isEmpty
            ? ScreenEnum.emptyScreen
            : ScreenEnum.errorScreen;
      }

      return;
    }
  }

  void notifyListenersSearchScreen() {
    notifyListeners();
  }

  ///Проверка вхождения точки в радиус
// bool _arePointsNear(final double checkPointLat, final double checkPointLon) {
//   const centerPointLat = 55.753605;
//   const centerPointLon = 37.619773;
//   const kyPoint = 40000000 / 360; //40000000 - длина окружности земли в метрах
//   final kxPoint = cos(pi * centerPointLat / 180.0) * kyPoint;
//   final dxPoint = (centerPointLon - checkPointLon).abs() * kxPoint;
//   final dyPoint = (centerPointLat - checkPointLat).abs() * kyPoint;
//
//   return sqrt(dxPoint * dxPoint + dyPoint * dyPoint) <=
//           SearchFilterModel.selectedRange.end &&
//       sqrt(dxPoint * dxPoint + dyPoint * dyPoint) >=
//           SearchFilterModel.selectedRange.start;
// }
}
