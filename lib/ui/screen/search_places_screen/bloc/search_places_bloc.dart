import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/api/network_exception.dart';
import 'package:places/data/database/app_db.dart';
import 'package:places/data/interactor/list_places_interactor.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/data/model/place.dart';

import 'search_state_enum.dart';

part 'search_places_bloc.freezed.dart';

class SearchPlacesBloc extends Bloc<SearchPlacesEvents, SearchPlacesState> {
  final SearchInteractor _searchScreenInteractor;
  final ListPlacesInteractor _listPlacesInteractor;

  SearchPlacesBloc(
    this._searchScreenInteractor,
    this._listPlacesInteractor,
  ) : super(
          const SearchPlacesState.load(),
        ) {
    debugPrint('ListPlacesBloc ');
    on<SearchPlacesEvents>(
      (event, emitter) => event.map<Future<void>>(
        load: (event) => _load(event, emitter),
        newSearch: (event) => _onNewSearch(event, emitter),
        showSelectPlace: (event) => _onSelectSearch(event, emitter),
        clearHistory: (event) => _onClearHistory(event, emitter),
        deleteHistoryWord: (event) => _onDeleteHistoryWord(event, emitter),
      ),
      transformer: bloc_concurrency.sequential(),
    );
  }

  //Открытие экрана
  Future<void> _load(
    _onLoadSearchPlacesEvents event,
    Emitter<SearchPlacesState> emit,
  ) async {
    debugPrint('1 event = ${event.toString()}');
    debugPrint('1 emit = ${emit.toString()}');
    try {
      //Показываем экран загрузки
      emit(
        const SearchPlacesState.load(),
      );
      //Проверить историю поиск
      final listHistory = await _searchScreenInteractor.getListHistory();
      debugPrint('listHistory = ${listHistory.toString()}');
      //Показываем историю поиска
      if (listHistory.isNotEmpty &&
          event.listSearch.isEmpty &&
          event.stringSearch.isEmpty) {
        emit(
          SearchPlacesState.showListHistory(
            listHistory: listHistory,
          ),
        );

        return;
      }

      //Показываем пустой экран ни истори ни найденого ни введенных слова
      if (event.listHistory.isEmpty &&
          event.listSearch.isEmpty &&
          event.stringSearch.isEmpty) {
        emit(
          const SearchPlacesState.showEmpty(),
        );

        return;
      }
      emit(
        const SearchPlacesState.load(),
      );
    } on NetworkException {
      // emit(const ListPlacesState.error(message: 'Ошибка загрузки из сети'));
    } on Object {
      rethrow;
    } finally {
      debugPrint('2 event = ${event.toString()}');
      debugPrint('2 emitter = ${emit.toString()}');
    }
  }

  //Введено слово, начикаем поиск
  Future<void> _onNewSearch(
    _onNewSearchPlacesEvents event,
    Emitter<SearchPlacesState> emit,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emit.toString()}');
    try {
      emit(
        const SearchPlacesState.load(),
      );

      //Записали новое слово поиска в историю поиска
      await _searchScreenInteractor.addToListHistory(event.stringSearch);

//      final listPlace =
//           await _searchScreenInteractor.getFilteredList(event.stringSearch);
      final listPlace = await _listPlacesInteractor.getPlacesInteractor(
        searchString: event.stringSearch,
      );
      debugPrint('listPlace = = $listPlace');
      if (listPlace.isNotEmpty) {
        emit(
          SearchPlacesState.showSearch(
            listSearch: listPlace,
            stringSearch: event.stringSearch,
          ),
        );
      } else {
        emit(
          SearchPlacesState.showNotFound(
            listSearch: listPlace,
            stringSearch: event.stringSearch,
          ),
        );
      }
    } on Object {
      rethrow;
    }
  }

  Future<void> _onSelectSearch(
    _onShowSelectPlaceEvents event,
    Emitter<SearchPlacesState> emit,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emit.toString()}');
    try {
      //Показываем экран загрузки
      emit(
        SearchPlacesState.load(
          place: event.place,
        ),
      );

      if (event.place != null) {
        final place = await _listPlacesInteractor.getPlaceId(event.place!.id);
        emit(
          SearchPlacesState.showSelected(
            place: place,
          ),
        );
      } else {
        emit(
          const SearchPlacesState.showNotFound(),
        );
      }
    } on Object {
      rethrow;
    }
  }

  Future<void> _onClearHistory(
    _onClearHistoryEvents event,
    Emitter<SearchPlacesState> emit,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emit.toString()}');
    try {
      //Показываем экран загрузки

      _searchScreenInteractor.setSearchText('');
      await _searchScreenInteractor.clearHistory();

      emit(
        const SearchPlacesState.showEmpty(),
      );
    } on Object {
      rethrow;
    }
  }

  Future<void> _onDeleteHistoryWord(
    _onDeleteHistoryWordEvents event,
    Emitter<SearchPlacesState> emit,
  ) async {
    try {
      //Удаляем слово из истории поиска
      await _searchScreenInteractor.deleteHistoryWord(event.historyWordId);
      //Проверяем список слов в истории поиска
      final listHistoryNew = await _searchScreenInteractor.getListHistory();

      debugPrint('listHistoryNew = ${listHistoryNew.toString()}');

      //Слов нет, чистим все.
      if (listHistoryNew.isEmpty) {
        emit(
          const SearchPlacesState.showEmpty(),
        );
      } else {
        emit(
          SearchPlacesState.showListHistory(
            listHistory: listHistoryNew,
          ),
        );
      }
    } on Object {
      rethrow;
    }
  }
}

/// События
@freezed
class SearchPlacesEvents with _$SearchPlacesEvents {
  const SearchPlacesEvents._();

  const factory SearchPlacesEvents.load({
    @Default(<SearchQueryHistory>[]) final List<SearchQueryHistory> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
  }) = _onLoadSearchPlacesEvents;

  ///Запуск поиска
  const factory SearchPlacesEvents.newSearch({
    @Default('') final String stringSearch,
    @Default(<Place>[]) final List<Place> listSearch,
  }) = _onNewSearchPlacesEvents;

  ///Показать выбранное место
  const factory SearchPlacesEvents.showSelectPlace({
    @Default(null) final Place? place,
  }) = _onShowSelectPlaceEvents;

  const factory SearchPlacesEvents.clearHistory() = _onClearHistoryEvents;

  const factory SearchPlacesEvents.deleteHistoryWord({
    @Default(0) final int historyWordId,
  }) = _onDeleteHistoryWordEvents;
}

/// Состояния
@freezed
class SearchPlacesState with _$SearchPlacesState {
  SearchStateEnum get current => maybeMap<SearchStateEnum>(
        orElse: () => SearchStateEnum.error,
        load: (_) => SearchStateEnum.load,
        showSearch: (_) => SearchStateEnum.showSearch,
        showListHistory: (_) => SearchStateEnum.showListHistory,
        showEmpty: (_) => SearchStateEnum.showEmpty,
        showNotFound: (_) => SearchStateEnum.showNotFound,
        showSelected: (_) => SearchStateEnum.showSelected,
        error: (_) => SearchStateEnum.error,
      );

  const SearchPlacesState._();

  // Идет загрузка
  const factory SearchPlacesState.load({
    @Default(<SearchQueryHistory>[]) final List<SearchQueryHistory> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _LoadSearchPlacesState;

  const factory SearchPlacesState.loader({
    @Default(<SearchQueryHistory>[]) final List<SearchQueryHistory> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _LoaderSearchPlacesState;

  // Список загружен
  const factory SearchPlacesState.showSearch({
    @Default(<SearchQueryHistory>[]) final List<SearchQueryHistory> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _ShowSearchPlacesState;

  // Список историй поиска
  const factory SearchPlacesState.showListHistory({
    @Default(<Place>[]) final List<Place> listSearch,
    @Default(<SearchQueryHistory>[]) final List<SearchQueryHistory> listHistory,
    @Default(null) final Place? place,
    @Default('') final String stringSearch,
  }) = _ShowListHistoryPlacesState;

  // Показ пустого окна когда нет истории поиска
  const factory SearchPlacesState.showEmpty({
    @Default(<SearchQueryHistory>[]) final List<SearchQueryHistory> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _ShowEmptyState;

  // Показ окна с сообщением что ничего не найдено
  const factory SearchPlacesState.showNotFound({
    @Default(<SearchQueryHistory>[]) final List<SearchQueryHistory> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _ShowNotFound;

  const factory SearchPlacesState.showSelected({
    @Default(<SearchQueryHistory>[]) final List<SearchQueryHistory> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _ShowSelectedPlaceState;

  // Ошибка
  const factory SearchPlacesState.error({
    @Default(<SearchQueryHistory>[]) final List<SearchQueryHistory> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _ErrorSearchPlacesState;
}
