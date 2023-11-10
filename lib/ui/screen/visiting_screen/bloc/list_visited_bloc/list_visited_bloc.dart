import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/type_place.dart';

part 'list_visited_event.dart';

part 'list_visited_state.dart';

class ListVisitedBloc extends Bloc<ListVisitedEvent, ListVisitedState> {
  final VisitingInteractor visitingInteractor;

  ListVisitedBloc(this.visitingInteractor) : super(ListVisitedLoadState()) {
    ///Обработка события загрузка экрана
    on<ListVisitedLoadEvent>(_onListVisitedLoad);

    ///Обработка события окончание загрузки экрана
    on<ListVisitedLoadedEvent>(_onVisitedLoaded);

    ///Нажали на карточку места
    on<ListVisitedSelectPlaceEvent>(_onListVisitedSelectPlace);
  }

  Future<void> _onListVisitedLoad(
    ListVisitedLoadEvent event,
    Emitter<ListVisitedState> emit,
  ) async {
    debugPrint(' до загрузки');
    emit(ListVisitedLoadState());
    debugPrint(' после загрузки');
    final future = await visitingInteractor.getListWantVisitAndVisited();
    emit(
      ListVisitedLoadedState(future),
    );
  }

  Future<void> _onVisitedLoaded(
    ListVisitedLoadedEvent event,
    Emitter<ListVisitedState> emit,
  ) async {
    return;
  }

  Future<void> _onListVisitedSelectPlace(
    ListVisitedSelectPlaceEvent event,
    Emitter<ListVisitedState> emit,
  ) async {
    debugPrint('_selectedPlace = 1');

    emit(
      ListVisitedLoadedState(
        mocksWantVisit,
      ),
    );
    emit(
      ListVisitedPlaceSelectedState(
        event.place,
      ),
    );

    debugPrint('visitedTabRemovePlace = 2');
  }
}
