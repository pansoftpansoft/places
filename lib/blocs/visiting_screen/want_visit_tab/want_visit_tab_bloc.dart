// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/type_place.dart';

part 'want_visit_tab_event.dart';

part 'want_visit_tab_state.dart';

class WantVisitTabBloc extends Bloc<WantVisitTabEvent, WantVisitTabState> {
  final VisitingInteractor visitingInteractor;

  WantVisitTabBloc(this.visitingInteractor)
      : super(WantVisitTabLoadInProgress()) {
    ///Обработка события загрузка экрана
    on<WantVisitTabLoad>(
      (event, emit) async {
        await wantVisitTabBLoadCheck();
      },
    );

    ///Обработка события удаление меств из списка "Хочу посетить"
    on<WantVisitTabRemovePlace>(
      (event, emit) async {
        await wantVisitTabRemovePlace(event);
      },
    );

    ///Обработка переноса события из "хочу посетить" в "посещенные"
    on<WantVisitUpdateToVisited>(
      (event, emit) async {
        await wantVisitUpdateToVisited(event);
      },
    );
  }

  Future<void> wantVisitTabBLoadCheck() async {
    emit(WantVisitTabLoadInProgress());
    final future = visitingInteractor.getListWantVisitAndVisited();
    await future.whenComplete(
      () => emit(
        WantVisitTabLoadInSuccess(mocksWantVisit),
      ),
    );
  }

  Future<void> wantVisitTabRemovePlace(
    WantVisitTabRemovePlace event,
  ) async {
    final future = visitingInteractor.deletePlaceWantVisit(event.place);
    await future.whenComplete(
      () => emit(
        WantVisitTabLoadInSuccess(mocksWantVisit),
      ),
    );
  }

  Future<void> wantVisitUpdateToVisited(
      WantVisitUpdateToVisited event,
  ) async {
    final future = visitingInteractor.wantVisitUpdateToVisit(event.place);

    await future.whenComplete(
      () => emit(
        WantVisitTabLoadInSuccess(mocksWantVisit),
      ),
    );
  }
}
