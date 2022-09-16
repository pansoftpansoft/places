import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/api/network_exception.dart';
import 'package:places/data/interactor/search_screen_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/domain/history.dart';

import 'search_state_enum.dart';

part 'search_places_bloc.freezed.dart';

class SearchPlacesBloc extends Bloc<SearchPlacesEvents, SearchPlacesState> {
  final SearchScreenInteractor _searchScreenInteractor;

  SearchPlacesBloc(
    final this._searchScreenInteractor,
  ) : super(
          const SearchPlacesState.load(),
        ) {
    debugPrint('ListPlacesBloc ');
    on<SearchPlacesEvents>(
      (event, emitter) => event.map<Future<void>>(
        load: (event) => _load(event, emitter),
        loaded: (event) => _loaded(event, emitter),
        newSearch: (event) => _onNewSearch(event, emitter),
        selectSearch: (event) => _onSelectSearch(event, emitter),
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
            listSearch: event.listSearch,
            stringSearch: event.stringSearch,
          ),
        );

        return;
      }

      //Показываем пустой экран ни истори ни найденого ни введенных слова
      if (event.listHistory.isEmpty &&
          event.listSearch.isEmpty &&
          event.stringSearch.isEmpty) {
        emit(
          SearchPlacesState.showEmpty(
            listHistory: event.listHistory,
            listSearch: event.listSearch,
            stringSearch: event.stringSearch,
          ),
        );

        return;
      }
      emit(
        const SearchPlacesState.load(),
      );
    } on NetworkException {
      // emit(const ListPlacesState.error(message: 'Ошибка загрузки из сети'));
    } on Object catch (error, stackTrace) {
      rethrow;
    } finally {
      debugPrint('2 event = ${event.toString()}');
      debugPrint('2 emitter = ${emit.toString()}');
    }
  }

  Future<void> _loaded(
    _onLoadedSearchPlacesEvents event,
    Emitter<SearchPlacesState> emit,
  ) async {
    return;
  }

  //Введено слово, начикаем поиск
  Future<void> _onNewSearch(
    _onNewSearchPlacesEvents event,
    Emitter<SearchPlacesState> emitter,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emitter.toString()}');
    try {
      emit(
        const SearchPlacesState.load(),
      );

      //Записали новое слово поиска в историю поиска
      //await _searchScreenInteractor.addToListHistory(event.stringSearch);
      var listPlace =
          await _searchScreenInteractor.getFilteredList(event.stringSearch);
      debugPrint('listPlace = = ${listPlace}');
      if (listPlace.isNotEmpty) {
        emit(
          SearchPlacesState.showSearch(
            listHistory: event.listHistory,
            listSearch: listPlace,
            stringSearch: event.stringSearch,
          ),
        );
      } else {
        emit(
          SearchPlacesState.showNotFound(
            listHistory: event.listHistory,
            listSearch: listPlace,
            stringSearch: event.stringSearch,
          ),
        );
      }
    } on Object catch (error, stackTrace) {
      rethrow;
    }
  }

  Future<void> _onSelectSearch(
    _onSelectSearchPlacesEvents event,
    Emitter<SearchPlacesState> emitter,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emitter.toString()}');
    try {
      emit(
        SearchPlacesState.showSelected(
          listSearch: state.listSearch,
          stringSearch: state.stringSearch,
          place: event.place,
        ),
      );
    } on Object catch (error, stackTrace) {
      rethrow;
    }
  }
}

/// События
@freezed
class SearchPlacesEvents with _$SearchPlacesEvents {
  const SearchPlacesEvents._();

  const factory SearchPlacesEvents.load({
    @Default(<History>[]) final List<History> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _onLoadSearchPlacesEvents;

  const factory SearchPlacesEvents.loaded({
    @Default(<History>[]) final List<History> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _onLoadedSearchPlacesEvents;

  const factory SearchPlacesEvents.newSearch({
    @Default(<History>[]) final List<History> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _onNewSearchPlacesEvents;

  const factory SearchPlacesEvents.selectSearch({
    @Default(<History>[]) final List<History> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _onSelectSearchPlacesEvents;
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
    @Default(<History>[]) final List<History> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _LoadSearchPlacesState;

  const factory SearchPlacesState.loader({
    @Default(<History>[]) final List<History> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _LoaderSearchPlacesState;

  // Список загружен
  const factory SearchPlacesState.showSearch({
    @Default(<History>[]) final List<History> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _ShowSearchPlacesState;

  // Список историй поиска
  const factory SearchPlacesState.showListHistory({
    @Default(<History>[]) final List<History> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _ShowListHistoryPlacesState;

  // Показ пустого окна когда нет истории поиска
  const factory SearchPlacesState.showEmpty({
    @Default(<History>[]) final List<History> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _ShowEmptyState;

  // Показ окна с сообщением что ничего не найдено
  const factory SearchPlacesState.showNotFound({
    @Default(<History>[]) final List<History> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _ShowNotFound;

  const factory SearchPlacesState.showSelected({
    @Default(<History>[]) final List<History> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _ShowSelectedPlaceState;

  // Ошибка
  const factory SearchPlacesState.error({
    @Default(<History>[]) final List<History> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
    @Default('') final String stringSearch,
    @Default(null) final Place? place,
  }) = _ErrorSearchPlacesState;
}
