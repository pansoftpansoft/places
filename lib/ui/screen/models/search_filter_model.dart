import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:places/domain/database.dart';
import 'package:places/domain/history.dart';
import 'package:places/mocks.dart';

/*
Модель для поиска
*/
class SearchFilterModel extends ChangeNotifier {
  static RangeValues _selectedRange = const RangeValues(100, 1000);

  //
  static Map<TypePlace, bool> _filterMap = {
    TypePlace.hotel: false,
    TypePlace.restaurant: false,
    TypePlace.particular_place: false,
    TypePlace.park: false,
    TypePlace.museum: false,
    TypePlace.cafe: false,
  };

  //Запоминаем старые значения
  //Если нажата кнопка Показать то переписываем значения
  //Если пользователь вернулся на предыдущий экран то востановим текущие значения
  static Map<TypePlace, bool> _filterMapOld = {
    TypePlace.hotel: false,
    TypePlace.restaurant: false,
    TypePlace.particular_place: false,
    TypePlace.park: false,
    TypePlace.museum: false,
    TypePlace.cafe: false,
  };

  static int _countPlace = 0;

  static String _searchString = '';

  static int get countPlace => _countPlace;

  static List<History> listHistory = [];

  static bool isLoading = false;

  static ScreenEnum? selectedScreen;

  static TextEditingController textEditingControllerFind =
      TextEditingController();

  // Тестовая переменная для проверки экрана Ошибка.
  // false - нет ошибок, true - есть ошибка
  bool _errorTest = false;

  static set countPlace(int value) {
    _countPlace = value;
  }

  static RangeValues get selectedRange => _selectedRange;

  static Map<TypePlace, bool> get filterMap => _filterMap;

  static set selectedRange(RangeValues value) {
    _selectedRange = value;
  }

  static set filterMap(Map<TypePlace, bool> filterMapNew) {
    _filterMap = filterMapNew;
  }

  static bool GetTypePlaceValue(TypePlace typePlace) {
    return _filterMap[TypePlace] == null ? false : true;
  }

  void SetTypePlaceSelected(TypePlace typePlace) {
    _filterMap[typePlace] = _filterMap[typePlace] == false ? true : false;
  }

  //Подсчет отфильтрованных мест
  //Пометка мест что они попали в фильтр
  void CountFilteredPlaces() {
    int _countPlace = 0; //Подсчет отфильтрованных мест,
    // для отображения на кнопке
    for (var item in mocks) {
      item.visibleFilter = false;
      if (double.tryParse(item.lat) != null &&
          double.tryParse(item.lon) != null) {
        if (ArePointsNear(double.parse(item.lat.toString()),
                double.parse(item.lon.toString())) ==
            true) {
          if (SearchFilterModel.filterMap[item.type] == true) {
            item.visibleFilter = true;
            _countPlace++;
          }
        }
      }
    }
    countPlace = _countPlace;
    ManagerSelectionScreen();
    notifyListeners();
  }

  // Получить отфильтрованный список мест
  bool GetFilteredList() {
    countPlace = _countPlace;
    mocksSearch.clear();
    if (_searchString.isNotEmpty) {
      for (var item in mocks) {
        //фильтр установлен проверяем его и поиск по имени
        if (item.visibleFilter == true) {
          if (item.name.toLowerCase().contains(_searchString.toLowerCase()) ==
              true) {
            mocksSearch.add(item);
          }
        }
      }
    } else {
      //Если фильтр установлен показываем записи ограниченные фильтром
      //без учета строки поиска, так как она пустая
      for (var item in mocks) {
        if (item.visibleFilter == true) {
          mocksSearch.add(item);
        }
      }
    }
    return _errorTest;
  }

  //Сообщить всем что список мест изменился
  void ChangeSearch() {
    bool _error = false;
    isLoading = true;
    ManagerSelectionScreen(numberScreen: ScreenEnum.loadScreen);
    notifyListeners();
    _error = GetFilteredList();
    Timer(
      const Duration(seconds: 1),
      () {
        if (_error) {
          //ошибка выдаем экран сообщения
          ManagerSelectionScreen(numberScreen: ScreenEnum.errorScreen);
        } else {
          isLoading = false;
          ManagerSelectionScreen();
        }
        notifyListeners();
      },
    );
  }

  /*
  динамический поиск мест по вводимому тексту при нажатии пробела
  */
  void SearchPlaceForDynamicText(String searchString) {
    _searchString = searchString;
    ChangeSearch();
  }

  /*
  поиск мест по вводимому тексту при нажатии Enter
  c записью запроса в историю запросов
  */
  void SearchPlaceForEnter(String searchString) {
    //Ищем текст
    SearchPlaceForDynamicText(searchString);
    //сохранить текст поиска
    DBProvider.db!.addHistory(searchString);
  }

  //Расставить сохраненные настройки фильтра
  void GetFilterSettings() {
    for (var k in _filterMapOld.entries) {
      _filterMap[k.key] = k.value;
    }
  }

  //Сохранить настройки фильтра
  void SaveFilterSettings() {
    for (var k in _filterMap.entries) {
      _filterMapOld[k.key] = k.value;
    }
  }

  //Получаем список историй поиска
  static Future<int> getListHistory() async {
    listHistory = await DBProvider.db!.getListHistory();
    int _lengthList = 0;
    _lengthList = listHistory.length;
    return _lengthList;
  }

  //Очищаем список историй поиска
  void ClearHistory() async {
    await DBProvider.db!.ClearHistory();
    await getListHistory();
    notifyListeners();
  }

  //Удаляю одну запись из истории поиска
  void DeleteHistory(String historyText) async {
    DBProvider.DeleteHistory(historyText);
    await getListHistory();
    notifyListeners();
  }

  //Проверка вхождения точки в радиус
  bool ArePointsNear(double checkPointLat, double checkPointLon) {
    double centerPointLat = 55.753605;
    double centerPointLon = 37.619773;
    var ky = 40000000 / 360; //40000000 - длина окружности земли в метрах
    var kx = cos(pi * centerPointLat / 180.0) * ky;
    var dx = (centerPointLon - checkPointLon).abs() * kx;
    var dy = (centerPointLat - checkPointLat).abs() * ky;
    return sqrt(dx * dx + dy * dy) <= SearchFilterModel.selectedRange.end &&
        sqrt(dx * dx + dy * dy) >= SearchFilterModel.selectedRange.start;
  }

  void ManagerSelectionScreen({ScreenEnum? numberScreen}) {
    //Если экран жестко задан
    if (numberScreen != null) {
      print(SearchFilterModel.listHistory.length);
      selectedScreen = numberScreen;
      return;
    }
    //Отображение экрана в зависимости от данных
    //Идет загрузка
    if (SearchFilterModel.isLoading == 1) {
      selectedScreen = ScreenEnum.loadScreen;
      return;
    }
    // Количество отфильтрованных мест 0
    if (SearchFilterModel.countPlace == 0) {
      selectedScreen = ScreenEnum.emptyScreen;
      return;
    }
    //Есть найденные места
    if (SearchFilterModel.countPlace != 0 && mocksSearch.length > 0) {
      selectedScreen = ScreenEnum.listOfFoundPlacesScreen;
      return;
    } else {
      selectedScreen = ScreenEnum.emptyScreen;
      return;
    }
  }
}
