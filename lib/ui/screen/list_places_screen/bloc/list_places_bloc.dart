import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/api/network_exception.dart';
import 'package:places/data/interactor/list_places_screen_interactor.dart';
import 'package:places/data/model/filter_set.dart';
import 'package:places/data/model/place.dart';

part 'list_places_bloc.freezed.dart';

class ListPlacesBloc extends Bloc<ListPlacesEvents, ListPlacesState> {
  final ListPlacesScreenInteractor _listPlacesScreenInteractor;

  ListPlacesBloc(
    final this._listPlacesScreenInteractor,
  ) : super(
          const ListPlacesState.loaded(listPlaces: <Place>[]),
        ) {
    on<ListPlacesEvents>(
      (event, emitter) => event.map<Future<void>>(
        load: (event) => _load(event, emitter),
        loadDataWithoutReloadingList: (event) =>
            _loadDataWithoutReloadingList(event, emitter),
        loaded: (event) => _loaded(event, emitter),
        selected: (event) => _selected(event, emitter),
        addNew: (event) => _addNew(event, emitter),
        update: (event) => _update(event, emitter),
      ),
      transformer: bloc_concurrency.sequential(),
    );
  }

  Future<void> _load(
    _LoadListPlacesEvents event,
    Emitter<ListPlacesState> emit,
  ) async {
    emit(ListPlacesState.load(
      listPlaces: [],
      filterSet: event.filterSet,
    ));

    await Future<void>.delayed(const Duration(seconds: 1));

    try {
      final listPlacesEmpty =
          await _listPlacesScreenInteractor.loadListPlaces(event.filterSet);
      emit(ListPlacesState.loaded(listPlaces: listPlacesEmpty));
    } on NetworkException {
      emit(const ListPlacesState.error(message: 'Ошибка загрузки из сети'));
    } on Object {
      rethrow;
    } finally {
      debugPrint('2 event = ${event.toString()}');
      debugPrint('2 emitter = ${emit.toString()}');
    }
  }

  Future<void> _loadDataWithoutReloadingList(
    _LoadDataWithoutReloadingListEvents event,
    Emitter<ListPlacesState> emit,
  ) async {
    try {
      final listPlacesEmpty =
          await _listPlacesScreenInteractor.loadListPlaces(event.filterSet);
      emit(ListPlacesState.loaded(listPlaces: listPlacesEmpty));
    } on NetworkException {
      emit(const ListPlacesState.error(message: 'Ошибка загрузки из сети'));
    } on Object {
      rethrow;
    } finally {
      debugPrint('2 event = ${event.toString()}');
      debugPrint('2 emitter = ${emit.toString()}');
    }
  }

  Future<void> _loaded(
    _LoadedListPlacesEvents event,
    Emitter<ListPlacesState> emitter,
  ) async {
    debugPrint('_loaded event = ${event.toString()}');
    debugPrint('_loaded emitter = ${emitter.toString()}');
  }

  Future<void> _selected(
    _SelectListPlacesEvents event,
    Emitter<ListPlacesState> emit,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emit.toString()}');
    //Показываем экран загрузки
    emit(
      ListPlacesState.loaded(
        listPlaces: state.listPlaces,
      ),
    );
    try {
      //Получить место с реальными данными из базы
      //final listPlacesEmpty = await _listPlacesScreenInteractor.;
      emit(
        ListPlacesState.selected(
          listPlaces: state.listPlaces,
          place: state.listPlaces.singleWhere(
            (element) => element.id == event.place.id,
          ),
        ),
      );
      //
    } on Object {
      rethrow;
    }
  }

  Future<void> _addNew(
    _AddNewListPlacesEvents event,
    Emitter<ListPlacesState> emit,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emit.toString()}');
    try {
      emit(ListPlacesState.addNew(listPlaces: state.listPlaces));
      //
    } on Object {
      rethrow;
    }
  }

  Future<void> _update(
    _UpdateListPlacesEvents event,
    Emitter<ListPlacesState> emitter,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emitter.toString()}');
  }
}

/// События
@freezed
class ListPlacesEvents with _$ListPlacesEvents {
  const ListPlacesEvents._();

  const factory ListPlacesEvents.load({
    required final FilterSet filterSet,
  }) = _LoadListPlacesEvents;

  const factory ListPlacesEvents.loadDataWithoutReloadingList({
    required final FilterSet filterSet,
  }) = _LoadDataWithoutReloadingListEvents;

  const factory ListPlacesEvents.loaded() = _LoadedListPlacesEvents;

  const factory ListPlacesEvents.selected({required Place place}) =
      _SelectListPlacesEvents;

  const factory ListPlacesEvents.addNew() = _AddNewListPlacesEvents;

  const factory ListPlacesEvents.update() = _UpdateListPlacesEvents;
}

/// Состояния
@freezed
class ListPlacesState with _$ListPlacesState {
  bool get load => maybeMap<bool>(
        orElse: () => false,
        load: (_) => true,
      );

  bool get loaded => maybeMap<bool>(
        orElse: () => false,
        loaded: (_) => true,
      );

  bool get selected => maybeMap<bool>(
        orElse: () => false,
        selected: (_) => true,
      );

  bool get addNew => maybeMap<bool>(
        orElse: () => false,
        addNew: (_) => true,
      );

  bool get error => maybeMap<bool>(
        orElse: () => false,
        error: (_) => true,
      );

  @override
  List<Place> get listPlaces => maybeWhen<List<Place>>(
        orElse: () => <Place>[],
        addNew: (listPlaces) => listPlaces,
        loaded: (listPlaces) => listPlaces,
      );

  Place get place => maybeWhen<Place>(
        orElse: () => place,
        selected: (listPlaces, place) => place,
      );

  const ListPlacesState._();

  // Идет загрузка
  const factory ListPlacesState.load({
    @Default(<Place>[]) final List<Place> listPlaces,
    required final FilterSet filterSet,
  }) = _InLoadListPlacesState;

  const factory ListPlacesState.loadDataWithoutReloadingList({
    @Default(<Place>[]) final List<Place> listPlaces,
    required final FilterSet filterSet,
  }) = _LoadDataWithoutReloadingList;

  // Список загружен
  const factory ListPlacesState.loaded({
    @Default(<Place>[]) final List<Place> listPlaces,
  }) = _ShowListPlacesState;

  // Выбрана карточка
  const factory ListPlacesState.selected({
    @Default(<Place>[]) final List<Place> listPlaces,
    required final Place place,
  }) = _selectedListPlacesState;

  // Добавлена новая карточка
  const factory ListPlacesState.addNew({
    @Default(<Place>[]) final List<Place> listPlaces,
  }) = _addNewListPlacesState;

  // Ошибка
  const factory ListPlacesState.error({
    @Default(<Place>[]) final List<Place> listPlaces,
    @Default('Произошла ошибка') String message,
  }) = _ErrorListPlacesState;
}
