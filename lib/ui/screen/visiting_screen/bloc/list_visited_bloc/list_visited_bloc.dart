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
    on<ListVisitedLoadedEvent>(_onWantVisitLoaded);

    ///Обработка события удаление меств из списка "Посещенные"
    on<ListVisitedRemovePlaceEvent>(_onListVisitedRemovePlace);

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
    final future = visitingInteractor.getListWantVisitAndVisited();
    await future.whenComplete(
      () => emit(
        ListVisitedLoadedState(mocksVisited),
      ),
    );
  }

  Future<void> _onWantVisitLoaded(
    ListVisitedLoadedEvent event,
    Emitter<ListVisitedState> emit,
  ) async {
    return;
  }

  Future<void> _onListVisitedRemovePlace(
    ListVisitedRemovePlaceEvent event,
    Emitter<ListVisitedState> emit,
  ) async {
    debugPrint('visitedTabRemovePlace = 1');
    final future = visitingInteractor.deletePlaceVisited(event.place);
    await future.whenComplete(
      () => emit(
        ListVisitedLoadedState(
          mocksVisited,
        ),
      ),
    );
    debugPrint('visitedTabRemovePlace = 2');
  }

  Future<void> _onListVisitedSelectPlace(
    ListVisitedSelectPlaceEvent event,
    Emitter<ListVisitedState> emit,
  ) async {
    debugPrint('_selectedPlace = 1');

    emit(
      ListVisitedPlaceSelectedState(
        event.place,
      ),
    );

    debugPrint('visitedTabRemovePlace = 2');
  }
}
