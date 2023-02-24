// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/api/network_exception.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/data/model/filter_distance.dart';
import 'package:places/ui/screen/filters_screen/bloc/filter_state_enum.dart';

part 'filter_bloc.freezed.dart';

class FilterBloc extends Bloc<FilterEvents, FilterState> {
  final FiltersScreenInteractor _filtersScreenInteractor;

  FilterBloc(
    final this._filtersScreenInteractor,
  ) : super(
          const FilterState.load(),
        ) {
    debugPrint('ListPlacesBloc ');
    on<FilterEvents>(
      (event, emitter) => event.map<Future<void>>(
        load: (event) => _load(event, emitter),
        loaded: (event) => _loaded(event, emitter),
        updateFilterCategory: (event) =>
            _onUpdateFilterCategory(event, emitter),
        updateFilterDistance: (event) =>
            _onUpdateFilterDistance(event, emitter),
        saveSetting: (event) => _onSaveSetting(event, emitter),
        showResult: (event) => _onShowResult(event, emitter),
        clear: (event) => _onClear(event, emitter),
      ),
      transformer: bloc_concurrency.sequential(),
    );
  }

  Future<void> _load(
    _onLoadFilterEvents event,
    Emitter<FilterState> emit,
  ) async {
    debugPrint('1 event = ${event.toString()}');
    debugPrint('1 emit = ${emit.toString()}');
    try {
      //Показываем экран загрузки
      emit(
        const FilterState.load(),
      );

      final listFilterCategory =
          await _filtersScreenInteractor.getSettingsFilterCategory();

      final filterMap = <String, bool>{};

      debugPrint('filterMap = ${filterMap.length}');

      if (listFilterCategory.isNotEmpty) {
        for (final item in listFilterCategory) {
          filterMap[item.category] = item.categoryValue == 1;
        }
      }

      final filterDistance =
          await _filtersScreenInteractor.getSettingsFilterDistance();

      debugPrint('filterDistance filterDistance = ${filterDistance.toMap()}');

      await _filtersScreenInteractor.getDataFromRepository(
        filterMap: filterMap,
        rangeDistance: filterDistance,
      );

      emit(
        FilterState.loaded(
          filterMap: filterMap,
          filterDistance: filterDistance,
        ),
      );

      return;
    } on NetworkException {
      // emit(const ListPlacesState.error(message: 'Ошибка загрузки из сети'));
    } on Object {
      rethrow;
    } finally {
      debugPrint('2 event = ${event.toString()}');
      debugPrint('2 emitter = ${emit.toString()}');
    }
  }

  //Открытие экрана
  Future<void> _loaded(
    _onLoadedFilterEvents event,
    Emitter<FilterState> emit,
  ) async {
    debugPrint('1 event = ${event.toString()}');
    debugPrint('1 emit = ${emit.toString()}');
    try {
      emit(
        FilterState.loaded(
          filterMap: state.filterMap,
          filterDistance: state.filterDistance,
        ),
      );

      return;
    } on NetworkException {
      // emit(const ListPlacesState.error(message: 'Ошибка загрузки из сети'));
    } on Object {
      rethrow;
    } finally {
      debugPrint('2 event = ${event.toString()}');
      debugPrint('2 emitter = ${emit.toString()}');
    }
  }

  //Запоминаем отмеченную категорию
  Future<void> _onUpdateFilterCategory(
    _onUpdateFilterCategoryEvents event,
    Emitter<FilterState> emitter,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emitter.toString()}');
    try {
      //Взводим галочку на кнопке категорий

      final filterMap = <String, bool>{}..addAll(state.filterMap);

      if (filterMap[event.selectedCategory]!) {
        filterMap[event.selectedCategory] = false;
      } else {
        filterMap[event.selectedCategory] = true;
      }

      //Обновляем количество отобранных объектов на кнопке

      await _filtersScreenInteractor.getDataFromRepository(
        filterMap: filterMap,
        rangeDistance: state.filterDistance,
      );

      emit(
        FilterState.loaded(
          filterMap: filterMap,
          filterDistance: state.filterDistance,
        ),
      );
    } on Object {
      rethrow;
    }
  }

  Future<void> _onUpdateFilterDistance(
    _onUpdateFilterDistanceEvents event,
    Emitter<FilterState> emitter,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emitter.toString()}');

    try {
      await _filtersScreenInteractor.getDataFromRepository(
        filterMap: state.filterMap,
        rangeDistance: event.filterDistance,
      );

      emit(
        FilterState.loaded(
          filterMap: state.filterMap,
          filterDistance: event.filterDistance,
        ),
      );
    } on Object {
      rethrow;
    }
  }

  Future<void> _onSaveSetting(
    _onSaveSettingEvents event,
    Emitter<FilterState> emitter,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emitter.toString()}');
    try {

      await _filtersScreenInteractor.saveFilterSettings(
        filterMap: state.filterMap,
        filterDistance: state.filterDistance ?? FilterDistance(0, 100, 1000),
      );

      emit(
        const FilterState.showResult(),
      );
    } on Object {
      rethrow;
    }
  }

  Future<void> _onShowResult(
    _onShowResultEvents event,
    Emitter<FilterState> emit,
  ) async {
    debugPrint('event = ${event.toString()}');
    //Просто возвращаемся на предыдущий экран
  }

  Future<void> _onClear(
    _onClearEvents event,
    Emitter<FilterState> emitter,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emitter.toString()}');
    try {
      final filterMap = <String, bool>{};
      for (final item in state.filterMap.keys.toList()) {
        filterMap[item] = false;
      }

      final filterDistance = FilterDistance(0, 100, 1000);

      await _filtersScreenInteractor.getDataFromRepository();

      emit(
        FilterState.loaded(
          filterMap: filterMap,
          filterDistance: filterDistance,
        ),
      );
    } on Object {
      rethrow;
    }
  }
}

/// События
@freezed
class FilterEvents with _$FilterEvents {
  const FilterEvents._();

  const factory FilterEvents.load({
    @Default(<String, bool>{}) final Map<String, bool> filterMap,
    final FilterDistance? filterDistance,
    @Default('') final String selectedCategory,
  }) = _onLoadFilterEvents;

  const factory FilterEvents.loaded({
    @Default(<String, bool>{}) final Map<String, bool> filterMap,
    final FilterDistance? filterDistance,
    @Default('') final String selectedCategory,
  }) = _onLoadedFilterEvents;

  const factory FilterEvents.updateFilterCategory({
    @Default(<String, bool>{}) final Map<String, bool> filterMap,
    final FilterDistance? filterDistance,
    @Default('') final String selectedCategory,
  }) = _onUpdateFilterCategoryEvents;

  const factory FilterEvents.updateFilterDistance({
    @Default(<String, bool>{}) final Map<String, bool> filterMap,
    final FilterDistance? filterDistance,
    @Default('') final String selectedCategory,
  }) = _onUpdateFilterDistanceEvents;

  const factory FilterEvents.saveSetting({
    @Default(<String, bool>{}) final Map<String, bool> filterMap,
    final FilterDistance? filterDistance,
    @Default('') final String selectedCategory,
  }) = _onSaveSettingEvents;

  const factory FilterEvents.showResult({
    @Default(<String, bool>{}) final Map<String, bool> filterMap,
    final FilterDistance? filterDistance,
    @Default('') final String selectedCategory,
  }) = _onShowResultEvents;

  const factory FilterEvents.clear({
    @Default(<String, bool>{}) final Map<String, bool> filterMap,
    final FilterDistance? filterDistance,
    @Default('') final String selectedCategory,
  }) = _onClearEvents;
}

/// Состояния
@freezed
class FilterState with _$FilterState {
  FilterStateEnum get current => maybeMap<FilterStateEnum>(
        orElse: () => FilterStateEnum.error,
        load: (_) => FilterStateEnum.load,
        loaded: (_) => FilterStateEnum.loaded,
        showResult: (_) => FilterStateEnum.showResult,
      );

  const FilterState._();

  // Идет загрузка
  const factory FilterState.load({
    @Default(<String, bool>{}) final Map<String, bool> filterMap,
    final FilterDistance? filterDistance,
    @Default('') final String selectedCategory,
  }) = _LoadFilterState;

  const factory FilterState.loaded({
    @Default(<String, bool>{}) final Map<String, bool> filterMap,
    final FilterDistance? filterDistance,
    @Default('') final String selectedCategory,
  }) = _LoadedFilterState;

  const factory FilterState.updateFilterCategory({
    @Default(<String, bool>{}) final Map<String, bool> filterMap,
    final FilterDistance? filterDistance,
    @Default('') final String selectedCategory,
  }) = _UpdateFilterCategoryState;

  // Список историй поиска
  const factory FilterState.updateFilterDistance({
    @Default(<String, bool>{}) final Map<String, bool> filterMap,
    final FilterDistance? filterDistance,
    @Default('') final String selectedCategory,
  }) = _UpdateFilterDistanceState;

  // Показ пустого окна когда нет истории поиска
  const factory FilterState.saveSetting({
    @Default(<String, bool>{}) final Map<String, bool> filterMap,
    final FilterDistance? filterDistance,
    @Default('') final String selectedCategory,
  }) = _SaveSettingState;

  const factory FilterState.showResult({
    @Default(<String, bool>{}) final Map<String, bool> filterMap,
    final FilterDistance? filterDistance,
    @Default('') final String selectedCategory,
  }) = _ShowResultState;
}
