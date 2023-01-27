// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/api/network_exception.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';

import 'package:places/data/model/place.dart';
import 'package:places/domain/history.dart';

part 'filters_bloc.freezed.dart';

class FiltersBloc extends Bloc<FiltersEvents, FiltersState> {
  final FiltersScreenInteractor _filterInteractor;

  FiltersBloc(
    final this._filterInteractor,
  ) : super(
          const FiltersState.load(),
        ) {
    debugPrint('ListPlacesBloc ');
    on<FiltersEvents>(
      (event, emitter) => event.map<Future<void>>(
        load: (event) => _load(event, emitter),
      ),
      transformer: bloc_concurrency.sequential(),
    );
  }

  //Открытие экрана
  Future<void> _load(
    _onLoadFiltersEvents event,
    Emitter<FiltersState> emit,
  ) async {
    try {
      debugPrint('1 event = ${event.toString()}');
      debugPrint('1 emitter = ${emit.toString()}');

      //Показываем экран загрузки
      // emit(
      //   const FiltersState.load(),
      // );
      // //Проверить историю поиск
      // //final listHistory = await _searchScreenInteractor.getListHistory();
      // debugPrint('listHistory = ${listHistory.toString()}');
      // //Показываем историю поиска
      // if (listHistory.isNotEmpty &&
      //     event.listSearch.isEmpty &&
      //     event.stringSearch.isEmpty) {
      //   emit(
      //     SearchPlacesState.showListHistory(
      //       listHistory: listHistory,
      //       listSearch: event.listSearch,
      //       stringSearch: event.stringSearch,
      //     ),
      //   );
      //
      //   return;
      // }

      //Показываем пустой экран ни истори ни найденого ни введенных слова
      // if (event.listHistory.isEmpty &&
      //     event.listSearch.isEmpty &&
      //     event.stringSearch.isEmpty) {
      //   emit(
      //     const SearchPlacesState.showEmpty(),
      //   );

      //return;
      // }
      // emit(
      //   const SearchPlacesState.load(),
      // );
    } on NetworkException {
      // emit(const ListPlacesState.error(message: 'Ошибка загрузки из сети'));
    } on Object catch (error, stackTrace) {
      rethrow;
    } finally {
      debugPrint('2 event = ${event.toString()}');
      debugPrint('2 emitter = ${emit.toString()}');
    }
  }
}

/// События
@freezed
class FiltersEvents with _$FiltersEvents {
  const FiltersEvents._();

  const factory FiltersEvents.load({
    @Default(<History>[]) final List<History> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
  }) = _onLoadFiltersEvents;
}

/// Состояния
@freezed
class FiltersState with _$FiltersState {
  const FiltersState._();

  // Идет загрузка
  const factory FiltersState.load({
    @Default(<History>[]) final List<History> listHistory,
    @Default(<Place>[]) final List<Place> listSearch,
  }) = _LoadFiltersState;
}
