// ignore_for_file: unnecessary_getters_setters

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/domain/db_provider.dart';
import 'package:places/domain/history.dart';
import 'package:places/type_place.dart';

///Модель для поиска
class SearchScreenInteractor extends ChangeNotifier {
  ///Список истории поисковых запросов
  static List<History> listHistory = <History>[];

  ///Контроллер поля поиска
  static TextEditingController textEditingControllerFind =
      TextEditingController();

  ///
  final bool _errorTest = false;

  PlaceInteractor placeInteractor = PlaceInteractor();

  ScreenEnum? selectedScreen;

  String get searchString => _searchString;

  String _searchString = '';

  ///Получаем список историй поиска
  Future<List<History>> getListHistory() async {
    listHistory.clear();
    listHistory = (await DBProvider.dbProvider.getListHistoryFromDb())!;

    return listHistory;
  }

  ///Получаем список историй поиска
  Future<void> addToListHistory(String value) async {
    await DBProvider.dbProvider.addHistory(value);
  }

  /// Получить отфильтрованный список мест
  /// И проверить на совподение со строкой поиска
  Future<List<Place>> getFilteredList(String value) async {
    final listPlace = await placeInteractor.getPlacesInteractor(
      searchString: value,
    );
    return listPlace;
  }

  Future<void> getListSearchText() async {
    mocksSearchText.clear();
    if (_searchString.isNotEmpty) {
      mocksSearchText = await placeInteractor.getPlacesInteractor(
        searchString: _searchString,
      );
    }
    debugPrint(' countPlace 4  = ${mocksSearchText.length}');

    return;
  }

  ///Сообщить всем что список мест изменился
  Future<void> changeSearch() async {
    ///Запускаем загрузчик
    await managerSelectionScreen(numberScreen: ScreenEnum.loadScreen);
    debugPrint('300 mocksSearch ${mocksSearchText.length.toString()}');
    if (mocksSearchText.isEmpty) {
      //ошибка выдаем экран сообщения
      debugPrint('Не найдено ни одного места');
      await managerSelectionScreen(numberScreen: ScreenEnum.emptyScreen);
    } else {
      debugPrint('Найдено ${mocksSearchText.length} места');
      await managerSelectionScreen(
        numberScreen: ScreenEnum.listFoundPlacesScreen,
      );
    }
  }

  ///Устанавливаем строку поиска
  void setSearchText(String searchString) {
    mocksSearchText.clear();
    if (searchString == '') {
      _searchString = '';
      SearchScreenInteractor.textEditingControllerFind.clear();
    } else {
      _searchString = searchString;

      SearchScreenInteractor.textEditingControllerFind.value = TextEditingValue(
        text: searchString,
        selection: TextSelection.fromPosition(
          TextPosition(offset: searchString.length),
        ),
      );
    }
  }

  /// поиск мест по вводимому тексту при нажатии Enter
  ///c записью запроса в историю запросов
  void searchPlaceForEnter(String searchString) {
    //Ищем текст
    setSearchText(searchString);
    //сохранить текст поиска
    DBProvider.dbProvider.addHistory(searchString);
  }

  ///Очищаем список историй поиска
  Future<void> clearHistory() async {
    SearchScreenInteractor.listHistory.clear();
    await DBProvider.dbProvider.deleteTheListOfSearchHistoryWords();
    await getListHistory(); //Обновляем список после удаления всех имторий
  }

  ///Удаляю одну запись из истории поиска
  Future<void> deleteHistory(String historyText) async {
    await DBProvider.deleteHistory(historyText);
    await getListHistory(); //Обновляем список после удаления всей истории
    notifyListeners();
  }

  ///Здесь мы устанавливаем какой экран хотим получить и корректируем
  ///в зависимости от данных, выдавая
  ///пустые экраны или экраны с ошибкой
  Future<void> managerSelectionScreen({ScreenEnum? numberScreen}) async {
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
}
