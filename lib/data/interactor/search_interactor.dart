import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/data/database/app_db.dart';
import 'package:places/data/repository/search_repository.dart';
import 'package:places/domain/sql_provider.dart';
import 'package:places/type_place.dart';

class SearchInteractor {
  ///Контроллер поля поиска
  static TextEditingController textEditingControllerFind =
      TextEditingController();

  final SearchRepository _searchRepository;

  ScreenEnum? selectedScreen;

  String get searchString => _searchString;

  String _searchString = '';

  SearchInteractor(this._searchRepository);

  ///Получаем список историй поиска
  Future<List<SearchQueryHistory>> getListHistory() async {
    return _searchRepository.getListSearchHistory();
  }

  ///Очищаем список историй поиска
  Future<void> clearHistory() async {
    await _searchRepository.clearSearchHistory();
  }

  ///Добавить поисковый запрос в список историй поиска
  Future<void> addToListHistory(String value) async {
    await _searchRepository.addHistory(value);
  }

  ///Удаляю одну запись из истории поиска
  Future<void> deleteHistoryWord(int id) async {
    await _searchRepository.deleteSearchRequest(id);
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
