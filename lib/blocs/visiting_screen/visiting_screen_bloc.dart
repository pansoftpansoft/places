// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/type_place.dart';

part 'visiting_screen_event.dart';

part 'visiting_screen_state.dart';

class VisitingScreenBloc
    extends Bloc<VisitingScreenEvent, VisitingScreenState> {
  final VisitingInteractor visitingInteractor;

  VisitingScreenBloc(this.visitingInteractor)
      : super(VisitingScreenLoadInProgress()) {
    ///Обработка события загрузка экрана
    on<VisitingScreenLoad>(
      (event, emit) async {
        await visitingScreenLoadCheck();
      },
    );

    ///Обработка события удаление меств из списка "Хочу посетить"
    on<VisitingScreenRemovePlace>(
      (event, emit) async {
        await visitingScreenRemovePlace(event);
      },
    );
  }

  Future<void> visitingScreenLoadCheck() async {
    emit(VisitingScreenLoadInProgress());
    final future = visitingInteractor.getListWantVisitAndVisited();
    await future.whenComplete(
      () => emit(
        VisitingScreenLoadInSuccess(mocksWantVisit),
      ),
    );
  }

  Future<void> visitingScreenRemovePlace(
    VisitingScreenRemovePlace event,
  ) async {
    final future = visitingInteractor.deletePlaceVisited(event.place);
    await future.whenComplete(
      () => emit(
        VisitingScreenLoadInSuccess(mocksWantVisit),
      ),
    );
  }
}
