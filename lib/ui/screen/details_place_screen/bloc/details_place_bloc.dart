import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data/interactor/details_place_interactor.dart';

part 'details_place_bloc.freezed.dart';

class DetailsPlaceBloc extends Bloc<DetailsPlaceEvents, DetailsPlaceState> {
  final DetailsPlaceInteractor _detailsPlaceInteractor;

  DetailsPlaceBloc(
    final this._detailsPlaceInteractor,
  ) : super(
          const DetailsPlaceState.selectedNewPageChanged(index: 0),
        ) {
    debugPrint('ListPlacesBloc ');
    on<DetailsPlaceEvents>(
      (event, emitter) => event.map<Future<void>>(
        onPageChanged: (event) => _onPageChanged(event, emitter),
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
      emit(DetailsPlaceState.selectedNewPageChanged(index: event.index));
    } on Object catch (error, stackTrace) {
      rethrow;
    }
  }
}

/// События
@freezed
class DetailsPlaceEvents with _$DetailsPlaceEvents {
  const DetailsPlaceEvents._();

  const factory DetailsPlaceEvents.onPageChanged(int index) =
      _OnPageChangedEvents;
}

/// Состояния
@freezed
class DetailsPlaceState with _$DetailsPlaceState {
  bool get selectedNewPageChanged => maybeMap<bool>(
        orElse: () => false,
        selectedNewPageChanged: (_) => true,
      );

  const DetailsPlaceState._();

  const factory DetailsPlaceState.selectedNewPageChanged({
    @Default(0) final int index,
  }) = _SelectedNewPageChanged;
}
