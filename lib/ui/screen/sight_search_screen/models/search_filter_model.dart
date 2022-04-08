// ignore_for_file: unnecessary_getters_setters

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:places/domain/db_provider.dart';
import 'package:places/domain/history.dart';
import 'package:places/type_place.dart';

///Модель для поиска
class SearchFilterModel extends ChangeNotifier {
  ///Список истории поисковых запросов
  static List<History> listHistory = <History>[];

  ///
  static ScreenEnum? selectedScreen;

  ///Контроллер поля поиска
  static TextEditingController textEditingControllerFind =
      TextEditingController();

  ///
  static RangeValues _selectedRange = const RangeValues(100, 1000);

  ///
  static var _countPlace = 0;

  static String _searchString = '';

  ///Мапа кнопок для фильтрации мест с изночальными значениями
  static Map<TypePlace, bool> _filterMap = <TypePlace, bool>{
    TypePlace.hotel: true,
    TypePlace.restaurant: true,
    TypePlace.particularPlace: true,
    TypePlace.park: true,
    TypePlace.museum: true,
    TypePlace.cafe: true,
  };

  //Запоминаем старые значения
  //Если нажата кнопка Показать то переписываем значения
  //Если пользователь вернулся на предыдущий
  //экран то востановим текущие значения
  static Map<TypePlace, bool> filterMapOld = <TypePlace, bool>{
    TypePlace.hotel: true,
    TypePlace.restaurant: true,
    TypePlace.particularPlace: true,
    TypePlace.park: true,
    TypePlace.museum: true,
    TypePlace.cafe: true,
  };

  // Тестовая переменная для проверки экрана Ошибка.
  // false - нет ошибок, true - есть ошибка
  final bool _errorTest = false;

  ///
  static int get countPlace => _countPlace;

  ///Количество интересных мест
  static set countPlace(final int value) {
    _countPlace = value;
  }

  ///
  static RangeValues get selectedRange => _selectedRange;

  ///
  static Map<TypePlace, bool> get filterMap => _filterMap;

  ///
  static set selectedRange(final RangeValues value) {
    _selectedRange = value;
  }

  ///
  static set filterMap(final Map<TypePlace, bool> filterMapNew) {
    _filterMap = filterMapNew;
  }

  ///
  static bool getTypePlaceValue() => _filterMap[TypePlace] == null;

  ///Получаем список историй поиска
  static Future<int> getListHistory() async {
    listHistory = (await DBProvider.dbProvider.getListHistoryFromDb())!;
    final _lengthList = listHistory.length;

    return _lengthList;
  }

  ///Взводим галочку на кнопке категорий
  void setTypePlaceSelected(final TypePlace typePlace) {
    if (_filterMap[typePlace]!) {
      _filterMap[typePlace] = false;
    } else {
      _filterMap[typePlace] = true;
    }
  }

  ///Подсчет отфильтрованных мест
  ///Пометка мест что они попали в фильтр
  void countFilteredPlaces() {
    var _countPlace = 0; //Подсчет отфильтрованных мест,
    // для отображения на кнопке
    debugPrint('mocks ${mocks.length}');
    for (final item in mocks) {
      item.visibleFilter = false;
      if (double.tryParse(item.lat) != null &&
          double.tryParse(item.lon) != null &&
          _arePointsNear(
            double.parse(item.lat),
            double.parse(item.lon),
          ) &&
          SearchFilterModel.filterMap[item.type]!) {
        item.visibleFilter = true;
        _countPlace++;
      }
    }
    countPlace = _countPlace;
    _selectedRange = RangeValues(SearchFilterModel.selectedRange.start,
        SearchFilterModel.selectedRange.end);
    debugPrint('countPlace $countPlace');
  }

  //Об
  void countFilteredPlacesSet() {
    countFilteredPlaces();
    notifyListeners();
  }

  /// Получить отфильтрованный список мест
  /// И проверить на совподение со строкой поиска
  bool getFilteredList() {
    countPlace = _countPlace;
    mocksSearch.clear();
    if (_searchString.isNotEmpty) {
      for (final item in mocks) {
        //фильтр установлен проверяем его и поиск по имени
        debugPrint(_searchString);
        if (item.visibleFilter) {
          if (item.name.toLowerCase().contains(_searchString.toLowerCase())) {
            mocksSearch.add(item);
          }
        }
      }
    } else {
      //Если фильтр установлен показываем записи ограниченные фильтром
      //без учета строки поиска, так как она пустая
      for (final item in mocks) {
        if (item.visibleFilter) {
          mocksSearch.add(item);
        }
      }
    }
    debugPrint('200 mocksSearch ${mocksSearch.length.toString()}');

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
        debugPrint('300 mocksSearch ${mocksSearch.length.toString()}');
        if (mocksSearch.isEmpty) {
          //ошибка выдаем экран сообщения
          debugPrint('Не найдено ни одного места');
          managerSelectionScreen(numberScreen: ScreenEnum.emptyScreen);
        } else {
          debugPrint('Найдено $countPlace места');
          managerSelectionScreen(
              numberScreen: ScreenEnum.listOfFoundPlacesScreen);
        }
        debugPrint('changeSearch notifyListeners()');
        notifyListeners();
      },
    );
  }

  ///Устанавливаем строку поиска
  void searchPlaceForDynamicText(final String searchString) {
    if (searchString == '') {
      _searchString = '';
      SearchFilterModel.textEditingControllerFind.clear();
    } else {
      _searchString = searchString;

      SearchFilterModel.textEditingControllerFind.value = TextEditingValue(
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
    searchPlaceForDynamicText(searchString);
    //сохранить текст поиска
    DBProvider.dbProvider.addHistory(searchString);
  }

  ///Расставить сохраненные настройки фильтра
  void getFilterSettings() {
    for (final k in filterMapOld.entries) {
      _filterMap[k.key] = k.value;
    }
  }

  ///Сохранить настройки фильтра
  void saveFilterSettings() {
    filterMapOld.clear();
    for (final k in _filterMap.entries) {
      filterMapOld[k.key] = k.value;
    }
  }

  ///Очищаем список историй поиска
  Future<void> clearHistory() async {
    await DBProvider.dbProvider.clearHistory();
    await getListHistory(); //Обновляем список после удаления всех имторий
  }

  ///Удаляю одну запись из истории поиска
  Future<void> deleteHistory(final String historyText) async {
    await DBProvider.deleteHistory(historyText);
    await getListHistory(); //Обновляем список после удаления всей истории
    notifyListeners();
  }

  ///
  Future<void> managerSelectionScreen({final ScreenEnum? numberScreen}) async {
    ///Если экран жестко задан
    debugPrint('managerSelectionScreen $numberScreen');
    if (numberScreen != null) {
      selectedScreen = numberScreen;

      /// Если найдено 0 мест то выдаем экрас с сообщением
      if (selectedScreen == ScreenEnum.listOfFoundPlacesScreen &&
          SearchFilterModel.countPlace == 0) {
        selectedScreen = ScreenEnum.emptyScreen;
      }

      return;
    }
  }

  ///Проверка вхождения точки в радиус
  bool _arePointsNear(final double checkPointLat, final double checkPointLon) {
    const centerPointLat = 55.753605;
    const centerPointLon = 37.619773;
    const kyPoint = 40000000 / 360; //40000000 - длина окружности земли в метрах
    final kxPoint = cos(pi * centerPointLat / 180.0) * kyPoint;
    final dxPoint = (centerPointLon - checkPointLon).abs() * kxPoint;
    final dyPoint = (centerPointLat - checkPointLat).abs() * kyPoint;

    return sqrt(dxPoint * dxPoint + dyPoint * dyPoint) <=
            SearchFilterModel.selectedRange.end &&
        sqrt(dxPoint * dxPoint + dyPoint * dyPoint) >=
            SearchFilterModel.selectedRange.start;
  }
}
