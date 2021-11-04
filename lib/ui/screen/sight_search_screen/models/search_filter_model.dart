import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/database.dart';
import 'package:places/domain/history.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';

///Модель для поиска
class SearchFilterModel extends ChangeNotifier {
  ///
  static RangeValues _selectedRange = const RangeValues(100, 1000);

  ///
  static Map<TypePlace, bool> _filterMap = <TypePlace, bool>{
    TypePlace.hotel: false,
    TypePlace.restaurant: false,
    TypePlace.particularPlace: false,
    TypePlace.park: false,
    TypePlace.museum: false,
    TypePlace.cafe: false,
  };

  //Запоминаем старые значения
  //Если нажата кнопка Показать то переписываем значения
  //Если пользователь вернулся на предыдущий
  // экран то востановим текущие значения
  static final Map<TypePlace, bool> _filterMapOld = <TypePlace, bool>{
    TypePlace.hotel: false,
    TypePlace.restaurant: false,
    TypePlace.particularPlace: false,
    TypePlace.park: false,
    TypePlace.museum: false,
    TypePlace.cafe: false,
  };

  static int _countPlace = 0;

  static String _searchString = '';

  ///
  static int get countPlace => _countPlace;

  ///
  static List<History> listHistory = <History>[];

  ///
  static bool isLoading = false;

  ///
  static ScreenEnum? selectedScreen;

  ///
  static TextEditingController textEditingControllerFind =
      TextEditingController();

  // Тестовая переменная для проверки экрана Ошибка.
  // false - нет ошибок, true - есть ошибка
  final bool _errorTest = false;

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
  static bool getTypePlaceValue(
    final TypePlace typePlace,
  ) =>
      _filterMap[TypePlace] == null ? false : true;

  ///
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
    int _countPlace = 0; //Подсчет отфильтрованных мест,
    // для отображения на кнопке
    for (final Sight item in mocks) {
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
    managerSelectionScreen();
    notifyListeners();
  }

  /// Получить отфильтрованный список мест
  bool getFilteredList() {
    countPlace = _countPlace;
    mocksSearch.clear();
    if (_searchString.isNotEmpty) {
      for (final Sight item in mocks) {
        //фильтр установлен проверяем его и поиск по имени
        if (item.visibleFilter) {
          if (item.name.toLowerCase().contains(_searchString.toLowerCase())) {
            mocksSearch.add(item);
          }
        }
      }
    } else {
      //Если фильтр установлен показываем записи ограниченные фильтром
      //без учета строки поиска, так как она пустая
      for (final Sight item in mocks) {
        if (item.visibleFilter) {
          mocksSearch.add(item);
        }
      }
    }

    return _errorTest;
  }

  ///Сообщить всем что список мест изменился
  void changeSearch() {
    bool _error = false;
    isLoading = true;
    managerSelectionScreen(numberScreen: ScreenEnum.loadScreen);
    notifyListeners();
    _error = getFilteredList();
    Timer(
      const Duration(seconds: 1),
      () {
        if (_error) {
          //ошибка выдаем экран сообщения
          managerSelectionScreen(numberScreen: ScreenEnum.errorScreen);
        } else {
          isLoading = false;
          managerSelectionScreen();
        }
        notifyListeners();
      },
    );
  }

  ///  динамический поиск мест по вводимому тексту при нажатии пробела
  void searchPlaceForDynamicText(final String searchString) {
    _searchString = searchString;
    changeSearch();
  }

  /// поиск мест по вводимому тексту при нажатии Enter
  ///c записью запроса в историю запросов
  void searchPlaceForEnter(final String searchString) {
    //Ищем текст
    searchPlaceForDynamicText(searchString);
    //сохранить текст поиска
    DBProvider.db.addHistory(searchString);
  }

  ///Расставить сохраненные настройки фильтра
  void getFilterSettings() {
    for (final MapEntry<TypePlace, bool> k in _filterMapOld.entries) {
      _filterMap[k.key] = k.value;
    }
  }

  ///Сохранить настройки фильтра
  void saveFilterSettings() {
    for (final MapEntry<TypePlace, bool> k in _filterMap.entries) {
      _filterMapOld[k.key] = k.value;
    }
  }

  ///Получаем список историй поиска
  static Future<int> getListHistory() async {
    listHistory = (await DBProvider.db.getListHistory())!;
    final int _lengthList = listHistory.length;

    return _lengthList;
  }

  ///Очищаем список историй поиска
  void clearHistory() async {
    await DBProvider.db.clearHistory();
    await getListHistory();
    notifyListeners();
  }

  ///Удаляю одну запись из истории поиска
  void deleteHistory(final String historyText) async {
    await DBProvider.deleteHistory(historyText);
    await getListHistory();
    notifyListeners();
  }

  ///Проверка вхождения точки в радиус
  bool _arePointsNear(final double checkPointLat, final double checkPointLon) {
    const double centerPointLat = 55.753605;
    const double centerPointLon = 37.619773;
    const double ky =
        40000000 / 360; //40000000 - длина окружности земли в метрах
    final double kx = cos(pi * centerPointLat / 180.0) * ky;
    final double dx = (centerPointLon - checkPointLon).abs() * kx;
    final double dy = (centerPointLat - checkPointLat).abs() * ky;

    return sqrt(dx * dx + dy * dy) <= SearchFilterModel.selectedRange.end &&
        sqrt(dx * dx + dy * dy) >= SearchFilterModel.selectedRange.start;
  }

  ///
  void managerSelectionScreen({final ScreenEnum? numberScreen}) {
    ///Если экран жестко задан
    if (numberScreen != null) {
      if (kDebugMode) {
        print(SearchFilterModel.listHistory.length);
      }
      selectedScreen = numberScreen;

      return;
    }
    //Отображение экрана в зависимости от данных
    //Идет загрузка
    if (SearchFilterModel.isLoading) {
      selectedScreen = ScreenEnum.loadScreen;

      return;
    }
    // Количество отфильтрованных мест 0
    if (SearchFilterModel.countPlace == 0) {
      selectedScreen = ScreenEnum.emptyScreen;

      return;
    }
    //Есть найденные места
    if (SearchFilterModel.countPlace != 0 && mocksSearch.isNotEmpty) {
      selectedScreen = ScreenEnum.listOfFoundPlacesScreen;

      return;
    } else {
      selectedScreen = ScreenEnum.emptyScreen;

      return;
    }
  }
}
