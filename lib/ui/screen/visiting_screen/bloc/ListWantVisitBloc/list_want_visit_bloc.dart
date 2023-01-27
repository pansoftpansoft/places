import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/interactor/list_places_screen_interactor.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/type_place.dart';

part 'list_want_visit_state.dart';

part 'list_want_visit_event.dart';

class ListWantVisitBloc extends Bloc<ListWantVisitEvent, ListWantVisitState> {
  final VisitingInteractor visitingInteractor;

  ListWantVisitBloc(this.visitingInteractor) : super(ListWantVisitLoadState()) {
    ///Обработка события загрузка экрана
    on<WantVisitLoadEvent>(_onWantVisitLoad);

    ///Обработка события окончание загрузки экрана
    on<WantVisitLoadedEvent>(_onWantVisitLoaded);

    ///Обработка события удаление меств из списка "Хочу посетить"
    on<WantVisitRemovePlaceEvent>(_onWantVisitRemovePlace);

    ///Обработка переноса события из "хочу посетить" в "посещенные"
    on<WantVisitUpdateDateEvent>(_onWantVisitUpdateDate);

    on<WantVisitSelectPlaceEvent>(_onWantVisitSelected);

  }

  Future<void> _onWantVisitLoad(
    WantVisitLoadEvent event,
    Emitter<ListWantVisitState> emit,
  ) async {
    emit(ListWantVisitLoadState());
    final future = visitingInteractor.getListWantVisitAndVisited();
    await future.whenComplete(
      () => emit(
        ListWantVisitLoadedState(mocksWantVisit),
      ),
    );
  }

  Future<void> _onWantVisitLoaded(
    WantVisitLoadedEvent event,
    Emitter<ListWantVisitState> emit,
  ) async {
    return;
  }

  Future<void> _onWantVisitRemovePlace(
    WantVisitRemovePlaceEvent event,
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

  Future<void> _onWantVisitUpdateDate(
    WantVisitUpdateDateEvent event,
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

  Future<void> _onWantVisitSelected(
      WantVisitSelectPlaceEvent event,
      Emitter<ListWantVisitState> emit,
      ) async {
      emit(
        ListWantVisitPlaceSelectedState(
             event.place,
        ),
      );
  }
}
