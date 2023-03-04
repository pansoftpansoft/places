// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/api/network_exception.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/data/model/filter_set.dart';
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
    try {
      //Показываем экран загрузки
      emit(const FilterState.load());

      final selectedCategory =
          await _filtersScreenInteractor.getSettingsFilterCategory();

      final rangeDistance =
          await _filtersScreenInteractor.getSettingsFilterDistance();

      final filterSet = FilterSet(
        selectedCategory: selectedCategory.toSet(),
        rangeDistance: rangeDistance,
      );

      emit(
        FilterState.loaded(
          filterSet: filterSet,
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
        FilterState.loaded(filterSet: event.filterSet),
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
      //Взводим галочку  на кнопке категорий или убираем
      final setCategory = state.filterSet.selectedCategory;

      if (setCategory.contains(event.selectedCategory)) {
        setCategory.remove(event.selectedCategory);
      } else {
        setCategory.add(event.selectedCategory);
      }

      emit(
        FilterState.loaded(
          filterSet: state.filterSet.copyWith(selectedCategory: setCategory),
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
      final setDistance = state.filterSet.rangeDistance;

      emit(
        FilterState.loaded(
          filterSet: state.filterSet.copyWith(rangeDistance: setDistance),
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
        filterSet: state.filterSet,
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
      const filterSet = FilterSet();

      emit(
        const FilterState.loaded(filterSet: filterSet),
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

  const factory FilterEvents.load() = _onLoadFilterEvents;

  const factory FilterEvents.loaded({
    required final FilterSet filterSet,
  }) = _onLoadedFilterEvents;

  const factory FilterEvents.updateFilterCategory({
    @Default('') final String selectedCategory,
  }) = _onUpdateFilterCategoryEvents;

  const factory FilterEvents.updateFilterDistance({
    final RangeValues? filterDistance,
  }) = _onUpdateFilterDistanceEvents;

  const factory FilterEvents.saveSetting() = _onSaveSettingEvents;

  const factory FilterEvents.showResult({
    required final FilterSet filterSet,
  }) = _onShowResultEvents;

  const factory FilterEvents.clear() = _onClearEvents;
}

/// Состояния
@freezed
class FilterState with _$FilterState {
  FilterSet get filterSet => maybeWhen<FilterSet>(
        orElse: () => filterSet,
        load: () => filterSet,
        loaded: (filterSet) => filterSet,
      );

  FilterStateEnum get current => maybeMap<FilterStateEnum>(
        orElse: () => FilterStateEnum.error,
        load: (_) => FilterStateEnum.load,
        loaded: (_) => FilterStateEnum.loaded,
        showResult: (_) => FilterStateEnum.showResult,
      );

  const FilterState._();

  // Идет загрузка
  const factory FilterState.load() = _LoadFilterState;

  const factory FilterState.loaded({required final FilterSet filterSet}) =
      _LoadedFilterState;

  const factory FilterState.updateFilterCategory({
    required final FilterSet filterSet,
    required final String selectedCategory,
  }) = _UpdateFilterCategoryState;

  const factory FilterState.updateFilterDistance({
    required final FilterSet filterSet,
    required final RangeValues filterDistance,
  }) = _UpdateFilterDistanceState;

  // Показ пустого окна когда нет истории поиска
  const factory FilterState.saveSetting({required final FilterSet filterSet}) =
      _SaveSettingState;

  const factory FilterState.showResult() = _ShowResultState;
}
