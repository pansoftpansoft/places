// ignore_for_file: unnecessary_getters_setters

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/domain/db_provider.dart';
import 'package:places/domain/history.dart';
import 'package:places/type_place.dart';

class SearchInteractor {
  ///Список истории поисковых запросов
  static List<History> listHistory = <History>[];

  ///Контроллер поля поиска
  static TextEditingController textEditingControllerFind =
      TextEditingController();

  PlaceInteractor placeInteractor = PlaceInteractor();

  ScreenEnum? selectedScreen;

  String get searchString => _searchString;

  String _searchString = '';

  ///Получаем список историй поиска
  Future<List<History>> getListHistory() async {
    listHistory.clear();
    listHistory = (await SqlProvider.dbProvider.getListHistoryFromDb())!;

    return listHistory;
  }

  Future<Place?> getPlaceId(int placeId) async {
    final place = await placeInteractor.getPlaceDetails(placeId);

    return place;
  }

  /// Получить отфильтрованный список мест
  /// И проверить на совподение со строкой поиска
  Future<List<Place>> getFilteredList(String value) async {
    final listPlace = await placeInteractor.getPlacesInteractor(
      searchString: value,
    );

    return listPlace;
  }

  ///Получаем список историй поиска
  Future<void> addToListHistory(String value) async {
    await SqlProvider.dbProvider.addHistory(value);
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
      SearchInteractor.textEditingControllerFind.clear();
    } else {
      _searchString = searchString;

      SearchInteractor.textEditingControllerFind.value = TextEditingValue(
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
    SqlProvider.dbProvider.addHistory(searchString);
  }

  ///Очищаем список историй поиска
  Future<void> clearHistory() async {
    SearchInteractor.listHistory.clear();
    await SqlProvider.dbProvider.deleteTheListOfSearchHistoryWords();
    await getListHistory(); //Обновляем список после удаления всех имторий
  }

  ///Удаляю одну запись из истории поиска
  Future<void> deleteHistory(String historyText) async {
    await SqlProvider.deleteHistory(historyText);
    await getListHistory(); //Обновляем список после удаления всей истории
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
