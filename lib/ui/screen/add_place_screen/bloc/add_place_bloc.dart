import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/api/network_exception.dart';
import 'package:places/data/interactor/add_place_interactor.dart';
import 'package:places/data/model/place.dart';

part 'add_place_bloc.freezed.dart';

class AddPlaceBloc extends Bloc<AddPlaceEvents, AddPlaceState> {
  final AddPlaceInteractor _addPlaceInteractor;

  AddPlaceBloc(
    final this._addPlaceInteractor,
  ) : super(
          const AddPlaceState.load(place: Place()),
        ) {
    debugPrint('AddPlaceBloc ');
    on<AddPlaceEvents>(
      (event, emitter) => event.map<Future<void>>(
        load: (event) => _load(event, emitter),
        onChangedFields: (event) => _onChangedFields(event, emitter),
        onCreatePlace: (event) => _onCreatePlace(event, emitter),
        onSelectPlaceType: (event) => _onSelectPlaceType(event, emitter),
        onSelectedPlaceType: (event) => _onSelectedPlaceType(event, emitter),
      ),
      transformer: bloc_concurrency.sequential(),
    );
  }

  Future<void> _load(
    _LoadAddPlaceEvents event,
    Emitter<AddPlaceState> emit,
  ) async {
    debugPrint('1 event = ${event.toString()}');
    debugPrint('1 emit = ${emit.toString()}');
    try {
      //final listPage = _addPlaceInteractor.selectCategory();
      emit(AddPlaceState.showPage(place: state.place));
    } on NetworkException {
      // emit(const ListPlacesState.error(message: 'Ошибка загрузки из сети'));
    } on Object catch (error, stackTrace) {
      rethrow;
    } finally {
      debugPrint('2 event = ${event.toString()}');
      debugPrint('2 emitter = ${emit.toString()}');
    }
  }

  Future<void> _onChangedFields(
    _onPageChangedAddPlaceEvents event,
    Emitter<AddPlaceState> emitter,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emitter.toString()}');
    try {
      emit(AddPlaceState.showPage(place: event.place.copyWith()));
    } on Object catch (error, stackTrace) {
      rethrow;
    }
  }

  Future<void> _onCreatePlace(
    _onCreatePlaceEvents event,
    Emitter<AddPlaceState> emitter,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emitter.toString()}');
    try {
      if (state.addReadyCheck == 1) {
        emit(AddPlaceState.showPage(place: state.place));
      }
    } on Object catch (error, stackTrace) {
      rethrow;
    }
  }

  Future<void> _onSelectPlaceType(
    _onSelectPlaceTypeEvents event,
    Emitter<AddPlaceState> emit,
  ) async {
    debugPrint('1 event = ${event.toString()}');
    debugPrint('1 emit = ${emit.toString()}');
    try {
      emit(AddPlaceState.selectPlaceType(place: state.place));
    } on NetworkException {
      // emit(const ListPlacesState.error(message: 'Ошибка загрузки из сети'));
    } on Object catch (error, stackTrace) {
      rethrow;
    } finally {
      debugPrint('2 event = ${event.toString()}');
      debugPrint('2 emitter = ${emit.toString()}');
    }
  }

  Future<void> _onSelectedPlaceType(
    _onSelectedPlaceTypeEvents event,
    Emitter<AddPlaceState> emit,
  ) async {
    debugPrint('1 event = ${event.toString()}');
    debugPrint('1 emit = ${emit.toString()}');
    try {
      emit(AddPlaceState.showPage(place: state.place));
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
class AddPlaceEvents with _$AddPlaceEvents {
  const AddPlaceEvents._();

  const factory AddPlaceEvents.load({
    required final Place place,
  }) = _LoadAddPlaceEvents;

  const factory AddPlaceEvents.onChangedFields({
    required final Place place,
  }) = _onPageChangedAddPlaceEvents;

  const factory AddPlaceEvents.onCreatePlace({
    required final Place place,
  }) = _onCreatePlaceEvents;

  const factory AddPlaceEvents.onSelectPlaceType({
    required final Place place,
  }) = _onSelectPlaceTypeEvents;

  const factory AddPlaceEvents.onSelectedPlaceType({
    required final Place place,
  }) = _onSelectedPlaceTypeEvents;
}

/// Состояния
@freezed
class AddPlaceState with _$AddPlaceState {
  //Проверка заполнения необходимых полей
  int get addReadyCheck {
    if (place.name.isNotEmpty && place.lat != 0 && place.lon != 0) {
      debugPrint('addReadyCheck = ${1}');

      return 1;
    }
    debugPrint('addReadyCheck = ${0}');

    return 0;
  }

  bool get selectPlaceType => maybeMap<bool>(
        orElse: () => false,
        selectPlaceType: (_) => true,
      );

  const AddPlaceState._();

  // Идет загрузка
  const factory AddPlaceState.load({
    required final Place place,
  }) = _LoadAddPlaceState;

  // Отобразить данные
  const factory AddPlaceState.showPage({
    required final Place place,
  }) = _ShowAddPlaceState;

  // Выбор типа места
  const factory AddPlaceState.selectPlaceType({
    required final Place place,
  }) = _SelectPlaceType;

  // Нажата кнопка создать место
  const factory AddPlaceState.createPlace({
    required final Place place,
  }) = _CreatePlaceType;

  // Ошибка
  const factory AddPlaceState.error({
    required final Place place,
  }) = _ErrorAddPlaceState;
}
