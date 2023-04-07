import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/type_place.dart';

part 'list_want_visit_state.dart';

part 'list_want_visit_event.dart';

class ListWantVisitBloc extends Bloc<ListWantVisitEvent, ListWantVisitState> {
  final VisitingInteractor visitingInteractor;

  ListWantVisitBloc(this.visitingInteractor) : super(ListWantVisitLoadState()) {
    ///Обработка события загрузка экрана
    on<ListWantVisitLoadEvent>(_onListWantVisitLoad);

    ///Обработка события окончание загрузки экрана
    on<ListWantVisitLoadedEvent>(_onListWantVisitLoaded);

    ///Обработка события удаление меств из списка "Хочу посетить"
    on<ListWantVisitRemovePlaceEvent>(_onListWantVisitRemovePlace);

    ///Установка даты когда хочу посетить
    on<ListWantVisitUpdateDateEvent>(_onListWantVisitUpdateDate);

    ///Обработка переноса события из "хочу посетить" в "посещенные"
    on<ListWantVisitPlaceUpdateToVisitedEvent>(
      _onListWantVisitPlaceUpdateToVisited,
    );

    ///Нажали на карточку места
    on<ListWantVisitSelectPlaceEvent>(_onListWantVisitSelected);
  }

  Future<void> _onListWantVisitLoad(
    ListWantVisitLoadEvent event,
    Emitter<ListWantVisitState> emit,
  ) async {
    emit(ListWantVisitLoadState());

    final listWantVisit = await visitingInteractor.getListWantVisitAndVisited();

    emit(
      ListWantVisitLoadedState(listWantVisit),
    );
  }

  Future<void> _onListWantVisitLoaded(
    ListWantVisitLoadedEvent event,
    Emitter<ListWantVisitState> emit,
  ) async {
    return;
  }

  Future<void> _onListWantVisitRemovePlace(
    ListWantVisitRemovePlaceEvent event,
    Emitter<ListWantVisitState> emit,
  ) async {
    emit(ListWantVisitLoadState());
    final future = visitingInteractor.deletePlaceWantVisit(event.place);
    await future.whenComplete(
      () => emit(
        ListWantVisitLoadedState(mocksWantVisit),
      ),
    );
  }

  Future<void> _onListWantVisitUpdateDate(
    ListWantVisitUpdateDateEvent event,
    Emitter<ListWantVisitState> emit,
  ) async {
    final future = visitingInteractor.dateWantVisit(
      event.place,
      event.newDate,
    );

    await future.whenComplete(
      () => emit(
        ListWantVisitLoadedState(mocksWantVisit),
      ),
    );
  }

  Future<void> _onListWantVisitSelected(
    ListWantVisitSelectPlaceEvent event,
    Emitter<ListWantVisitState> emit,
  ) async {
    emit(
      ListWantVisitLoadedState(
        mocksWantVisit,
      ),
    );
    emit(
      ListWantVisitPlaceSelectedState(
        event.place,
      ),
    );
  }

  Future<void> _onListWantVisitPlaceUpdateToVisited(
    ListWantVisitPlaceUpdateToVisitedEvent event,
    Emitter<ListWantVisitState> emit,
  ) async {
    final future = visitingInteractor.wantVisitUpdateToVisit(event.place);
    debugPrint(event.toString());
    await future.whenComplete(
      () => emit(
        ListWantVisitLoadedState(mocksWantVisit),
      ),
    );
  }
}
