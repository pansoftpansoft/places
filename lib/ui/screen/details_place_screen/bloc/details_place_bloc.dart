import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';

//import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/interactor/details_place_interactor.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';

part 'details_place_bloc.freezed.dart';

class DetailsPlaceBloc extends Bloc<DetailsPlaceEvents, DetailsPlaceState> {
  final DetailsPlaceInteractor _detailsPlaceInteractor;
  final PlaceInteractor _placeInteractor;

  DetailsPlaceBloc(
    final this._detailsPlaceInteractor,
    final this._placeInteractor,
  ) : super(
          const DetailsPlaceState.load(),
        ) {
    on<DetailsPlaceEvents>(
      (event, emitter) => event.map<Future<void>>(
        onPageChanged: (event) => _onPageChanged(event, emitter),
        onChangedFavorites: (event) => _onChangedFavorites(event, emitter),
        onChangedWantVisitDate: (event) =>
            _onChangedWantVisitDate(event, emitter),
        onLoaded: (event) => _onLoaded(event, emitter),
        onLoad: (event) => _onLoad(event, emitter),
      ),
      transformer: bloc_concurrency.sequential(),
    );
  }

  Future<void> _onLoad(
    _OnLoadEvents event,
    Emitter<DetailsPlaceState> emit,
  ) async {
    try {
      debugPrint('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
      debugPrint(event.place.toString());
      emit(DetailsPlaceState.load(place: event.place));

      final place = await _detailsPlaceInteractor.getPlace(state.place!.id);

      debugPrint(place!.name);
      debugPrint('place!.isFavorites = ${place.isFavorites.toString()}');

      await Future<void>.delayed(const Duration(seconds: 2));
      debugPrint('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
      debugPrint(place.toString());

      emit(
        DetailsPlaceState.loaded(
          place: place,
          isFavorites: place.isFavorites,
        ),
      );
      _detailsPlaceInteractor.changeScrollIndicator(event.index);
    } on Object {
      rethrow;
    }
  }

  Future<void> _onPageChanged(
    _OnPageChangedEvents event,
    Emitter<DetailsPlaceState> emit,
  ) async {
    try {
      _detailsPlaceInteractor.changeScrollIndicator(event.index);
      emit(
        DetailsPlaceState.selectedNewPageChanged(
          place: event.place,
          index: event.index,
        ),
      );
    } on Object {
      rethrow;
    }
  }

  Future<void> _onLoaded(
    _OnLoadedEvents event,
    Emitter<DetailsPlaceState> emit,
  ) async {
    debugPrint('_loaded event = ${event.toString()}');
    debugPrint('_loaded emitter = ${emit.toString()}');
  }

  Future<void> _onChangedFavorites(
    _OnChangedFavoritesEvents event,
    Emitter<DetailsPlaceState> emit,
  ) async {
    try {
      await _placeInteractor.setFavorites(
        event.place!.copyWith(
          isFavorites: !event.isFavorites,
        ),
      );
      emit(
        DetailsPlaceState.selectedNewPageChanged(
          place: event.place,
          index: state.index,
          isFavorites: !event.isFavorites,
          wantVisitDate: state.wantVisitDate,
        ),
      );
    } on Object {
      rethrow;
    }
  }

  Future<void> _onChangedWantVisitDate(
    _OnChangedWantVisitDateEvents event,
    Emitter<DetailsPlaceState> emit,
  ) async {
    try {
      int? dateTimeDiff;
      DateTime? dateTimeNew;
      if (event.wantVisitDate != null) {
        dateTimeDiff =
            (event.wantVisitDate ?? DateTime.now()).compareTo(DateTime.now());

        dateTimeNew = dateTimeDiff > 0 ? event.wantVisitDate : null;
      } else {
        dateTimeNew = null;
      }

      await _placeInteractor.setStatusPlaceWantVisitDate(
        state.place!.copyWith(
          wantVisitDate: dateTimeNew,
        ),
      );

      emit(
        DetailsPlaceState.selectedNewPageChanged(
          place: state.place,
          index: state.index,
          isFavorites: state.isFavorites,
          wantVisitDate: dateTimeNew,
        ),
      );
    } on Object {
      rethrow;
    }
  }
}

/// События
@freezed
class DetailsPlaceEvents with _$DetailsPlaceEvents {
  const DetailsPlaceEvents._();

  const factory DetailsPlaceEvents.onPageChanged({
    Place? place,
    @Default(0) final int index,
    @Default(false) final bool isFavorites,
    final DateTime? wantVisitDate,
  }) = _OnPageChangedEvents;

  const factory DetailsPlaceEvents.onChangedFavorites({
    Place? place,
    @Default(0) final int index,
    @Default(false) final bool isFavorites,
    final DateTime? wantVisitDate,
  }) = _OnChangedFavoritesEvents;

  const factory DetailsPlaceEvents.onChangedWantVisitDate({
    Place? place,
    @Default(0) final int index,
    @Default(false) final bool isFavorites,
    final DateTime? wantVisitDate,
  }) = _OnChangedWantVisitDateEvents;

  const factory DetailsPlaceEvents.onLoaded({
    Place? place,
    @Default(0) final int index,
    @Default(false) final bool isFavorites,
    final DateTime? wantVisitDate,
  }) = _OnLoadedEvents;

  const factory DetailsPlaceEvents.onLoad({
    Place? place,
    @Default(0) final int index,
    @Default(false) final bool isFavorites,
    final DateTime? wantVisitDate,
  }) = _OnLoadEvents;
}

/// Состояния
@freezed
class DetailsPlaceState with _$DetailsPlaceState {
  bool get selectedNewPageChanged => maybeMap<bool>(
        orElse: () => false,
        selectedNewPageChanged: (_) => true,
      );

  bool get load => maybeMap<bool>(
        orElse: () => false,
        load: (_) => true,
      );

  bool get loaded => maybeMap<bool>(
        orElse: () => false,
        loaded: (_) => true,
      );

  const DetailsPlaceState._();

  const factory DetailsPlaceState.selectedNewPageChanged({
    Place? place,
    @Default(0) final int index,
    @Default(false) final bool isFavorites,
    final DateTime? wantVisitDate,
  }) = _SelectedNewPageChanged;

  const factory DetailsPlaceState.selectedNewPlace({
    Place? place,
    @Default(0) final int index,
    @Default(false) final bool isFavorites,
    final DateTime? wantVisitDate,
  }) = _SelectedNewPlace;

  const factory DetailsPlaceState.loaded({
    Place? place,
    @Default(0) final int index,
    @Default(false) final bool isFavorites,
    final DateTime? wantVisitDate,
  }) = _Loaded;

  const factory DetailsPlaceState.load({
    Place? place,
    @Default(0) final int index,
    @Default(false) final bool isFavorites,
    final DateTime? wantVisitDate,
  }) = _Load;
}
