import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';
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
          DetailsPlaceState.selectedNewPlace(
            null,
            index: 0,
          ),
        ) {
    debugPrint('ListPlacesBloc ');
    on<DetailsPlaceEvents>(
      (event, emitter) => event.map<Future<void>>(
        onSelectNewPlace: (event) => _onSelectNewPlace(event, emitter),
        onPageChanged: (event) => _onPageChanged(event, emitter),
        onChangedFavorites: (event) =>
            _onChangedFavoritesEvents(event, emitter),
      ),
      transformer: bloc_concurrency.sequential(),
    );
  }

  Future<void> _onPageChanged(
    _OnPageChangedEvents event,
    Emitter<DetailsPlaceState> emit,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emit.toString()}');
    try {
      _detailsPlaceInteractor.changeScrollIndicator(event.index);
      emit(
        DetailsPlaceState.selectedNewPageChanged(
          event.place,
          index: event.index,
        ),
      );
    } on Object catch (error, stackTrace) {
      rethrow;
    }
  }

  Future<void> _onSelectNewPlace(
    _OnSelectNewPlace event,
    Emitter<DetailsPlaceState> emit,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emit.toString()}');
    try {
      _detailsPlaceInteractor.changeScrollIndicator(event.index);
      emit(
        DetailsPlaceState.selectedNewPageChanged(
          event.place,
          index: event.index,
        ),
      );
    } on Object catch (error, stackTrace) {
      rethrow;
    }
  }

  Future<void> _onChangedFavoritesEvents(
    _OnChangedFavoritesEvents event,
    Emitter<DetailsPlaceState> emit,
  ) async {
    debugPrint('event = ${event.toString()}');
    debugPrint('emitter = ${emit.toString()}');
    try {
      await _placeInteractor.setFavorites(
        event.place.copyWith(
          isFavorites: !event.isFavorites,
        ),
      );
      emit(
        DetailsPlaceState.selectedNewPageChanged(
          event.place,
          index: state.index,
          isFavorites: !event.isFavorites,
        ),
      );
    } on Object catch (error, stackTrace) {
      rethrow;
    }
  }
}

/// События
@freezed
class DetailsPlaceEvents with _$DetailsPlaceEvents {
  const DetailsPlaceEvents._();

  const factory DetailsPlaceEvents.onPageChanged(
    Place place, {
    @Default(0) final int index,
    @Default(false) final bool isFavorites,
  }) = _OnPageChangedEvents;

  const factory DetailsPlaceEvents.onSelectNewPlace(
    Place place, {
    @Default(0) final int index,
    @Default(false) final bool isFavorites,
  }) = _OnSelectNewPlace;

  const factory DetailsPlaceEvents.onChangedFavorites(
    Place place, {
    @Default(0) final int index,
    @Default(false) final bool isFavorites,
  }) = _OnChangedFavoritesEvents;
}

/// Состояния
@freezed
class DetailsPlaceState with _$DetailsPlaceState {
  bool get selectedNewPageChanged => maybeMap<bool>(
        orElse: () => false,
        selectedNewPageChanged: (_) => true,
      );

  const DetailsPlaceState._();

  const factory DetailsPlaceState.selectedNewPageChanged(
    final Place? place, {
    @Default(0) final int index,
    @Default(false) final bool isFavorites,
  }) = _SelectedNewPageChanged;

  const factory DetailsPlaceState.selectedNewPlace(
    final Place? place, {
    @Default(0) final int index,
    @Default(false) final bool isFavorites,
  }) = _SelectedNewPlace;
}
