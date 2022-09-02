import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/api/network_exception.dart';

part 'select_category_bloc.freezed.dart';

class SelectCategoryBloc
    extends Bloc<SelectCategoryEvents, SelectCategoryState> {
  SelectCategoryBloc()
      : super(
          const SelectCategoryState.loaded(),
        ) {
    debugPrint('ListPlacesBloc ');
    on<SelectCategoryEvents>(
      (event, emitter) => event.map<Future<void>>(
        load: (event) => _load(event, emitter),
        select: (event) => _select(event, emitter),
      ),
      transformer: bloc_concurrency.sequential(),
    );
  }

  Future<void> _load(
    _LoadSelectCategoryEvents event,
    Emitter<SelectCategoryState> emit,
  ) async {
    debugPrint('1 event = ${event.toString()}');
    debugPrint('1 emit = ${emit.toString()}');
    try {
      emit(
        SelectCategoryState.selected(
          currentSelectCategory: event.currentSelectCategory,
        ),
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

  Future<void> _select(
    _SelectCategoryEvents event,
    Emitter<SelectCategoryState> emit,
  ) async {
    debugPrint('1 event = ${event.toString()}');
    debugPrint('1 emit = ${emit.toString()}');
    try {
      if (state.currentSelectCategory == event.currentSelectCategory) {
        emit(
          const SelectCategoryState.selected(
            currentSelectCategory: '',
          ),
        );
      } else {
        emit(
          SelectCategoryState.selected(
            currentSelectCategory: event.currentSelectCategory,
          ),
        );
      }
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
class SelectCategoryEvents with _$SelectCategoryEvents {
  const SelectCategoryEvents._();

  const factory SelectCategoryEvents.load({
    @Default('') final String currentSelectCategory,
  }) = _LoadSelectCategoryEvents;

  const factory SelectCategoryEvents.select({
    @Default('') final String currentSelectCategory,
  }) = _SelectCategoryEvents;
}

/// Состояния
@freezed
class SelectCategoryState with _$SelectCategoryState {
  const SelectCategoryState._();

  // Идет загрузка
  const factory SelectCategoryState.loaded({
    @Default('') final String currentSelectCategory,
  }) = _LoadSelectCategoryState;

  // Список загружен
  const factory SelectCategoryState.selected({
    @Default('') final String currentSelectCategory,
  }) = _ShowSelectCategoryState;

  // Ошибка
  const factory SelectCategoryState.error({
    @Default('') final String currentSelectCategory,
  }) = _ErrorSelectCategoryState;
}
