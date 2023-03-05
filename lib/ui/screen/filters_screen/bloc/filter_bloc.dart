// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/api/network_exception.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/data/interactor/list_places_screen_interactor.dart';
import 'package:places/data/model/filter_set.dart';
import 'package:places/ui/screen/filters_screen/bloc/filter_state_enum.dart';

part 'filter_bloc.freezed.dart';

class FilterBloc extends Bloc<FilterEvents, FilterState> {
  final FiltersScreenInteractor _filtersScreenInteractor;
  final ListPlacesScreenInteractor _listPlacesScreenInteractor;

  FilterBloc(
    this._listPlacesScreenInteractor,
    this._filtersScreenInteractor,
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
        updateFilterOnlyDistance: (event) =>
            _onUpdateFilterOnlyDistance(event, emitter),
        saveSetting: (event) => _onSaveSetting(event, emitter),
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

      final selectedCategory =
          await _filtersScreenInteractor.getSettingsFilterCategory();

      debugPrint('1 selectedCategory = ${selectedCategory.toString()}');

      final rangeDistance =
          await _filtersScreenInteractor.getSettingsFilterDistance();

      debugPrint('2 rangeDistance = ${rangeDistance.toString()}');

      final filterSetNew = FilterSet(
        selectedCategory: selectedCategory.toSet(),
        rangeDistance: rangeDistance,
      );

      final listPlace = await _listPlacesScreenInteractor.loadListPlaces(
        filterSetNew,
      );

      debugPrint('3 listPlace.length = ${listPlace.length.toString()}');
      emit(
        FilterState.loaded(
          filterSet: filterSetNew.copyWith(
            quantitySelectedPlaces: listPlace.length,
          ),
        ),
      );

      return;
    } on NetworkException {
      // emit(const ListPlacesState.error(message: 'Ошибка загрузки из сети'));
    } on Object {
      rethrow;
    } finally {
      debugPrint('2 event = ${event.toString()}');
    }
  }

  //Открытие экрана
  Future<void> _loaded(
    _onLoadedFilterEvents event,
    Emitter<FilterState> emit,
  ) async {
    debugPrint('1 event = ${event.toString()}');

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
    }
  }

  //Запоминаем отмеченную категорию
  Future<void> _onUpdateFilterCategory(
    _onUpdateFilterCategoryEvents event,
    Emitter<FilterState> emitter,
  ) async {
    debugPrint('event = ${event.toString()}');
    try {
      //Взводим галочку  на кнопке категорий или убираем
      var setCategoryNew = Set.of(state.filterSet.selectedCategory);

      if (setCategoryNew.contains(event.selectedCategory)) {
        setCategoryNew.remove(event.selectedCategory);
      } else {
        setCategoryNew.add(event.selectedCategory);
      }

      emit(
        FilterState.loaded(
          filterSet: state.filterSet.copyWith(selectedCategory: setCategoryNew),
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

    try {
      FilterSet filterSetNew;

      filterSetNew = state.filterSet.copyWith(
        rangeDistance: event.filterDistance!,
      );

      final listPlace = await _listPlacesScreenInteractor.loadListPlaces(
        filterSetNew,
      );

      debugPrint(
        '_onUpdateFilterDistanceEvents  listPlace.length = ${listPlace.length.toString()}',
      );

      filterSetNew = state.filterSet.copyWith(
        quantitySelectedPlaces: listPlace.length,
      );

      emit(
        FilterState.loaded(
          filterSet: filterSetNew,
        ),
      );
    } on Object {
      rethrow;
    }
  }

  Future<void> _onUpdateFilterOnlyDistance(
    _onUpdateFilterOnlyDistanceEvents event,
    Emitter<FilterState> emitter,
  ) async {
    debugPrint('event = ${event.toString()}');

    try {
      FilterSet filterSetNew;

      filterSetNew = state.filterSet.copyWith(
        rangeDistance: event.filterDistance!,
      );

      emit(
        FilterState.loaded(
          filterSet: filterSetNew,
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

    try {
      await _filtersScreenInteractor.saveFilterSettings(
        filterSet: state.filterSet,
      );
    } on Object {
      rethrow;
    }
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

  const factory FilterEvents.updateFilterOnlyDistance({
    final RangeValues? filterDistance,
  }) = _onUpdateFilterOnlyDistanceEvents;

  const factory FilterEvents.saveSetting() = _onSaveSettingEvents;

  const factory FilterEvents.clear() = _onClearEvents;
}

/// Состояния
@freezed
class FilterState with _$FilterState {
  FilterSet get filterSet => maybeWhen<FilterSet>(
        orElse: () => const FilterSet(),
        load: () => const FilterSet(),
        loaded: (filterSet) => filterSet,
      );

  FilterStateEnum get current => maybeMap<FilterStateEnum>(
        orElse: () => FilterStateEnum.error,
        load: (_) => FilterStateEnum.load,
        loaded: (_) => FilterStateEnum.loaded,
      );

  const FilterState._();

  // Идет загрузка
  const factory FilterState.load() = _LoadFilterState;

  const factory FilterState.loaded({required final FilterSet filterSet}) =
      _LoadedFilterState;

  const factory FilterState.updateFilterCategory({
    required final String selectedCategory,
  }) = _UpdateFilterCategoryState;

  const factory FilterState.updateFilterDistance({
    required final RangeValues filterDistance,
  }) = _UpdateFilterDistanceState;

  ///Обновить только значение дистанции, чтобы не лезть в базу при движении слайдера
  const factory FilterState.updateFilterOnlyDistance({
    required final RangeValues filterDistance,
  }) = _UpdateFilterDistanceOnlyState;

  // Показ пустого окна когда нет истории поиска
  const factory FilterState.saveSetting({required final FilterSet filterSet}) =
      _SaveSettingState;
}
