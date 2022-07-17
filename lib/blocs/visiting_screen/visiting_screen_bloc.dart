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
    on<VisitingScreenLoad>((event, emit) async {
      await visitingScreenLoadCheck();
    });
  }

  Future<void> visitingScreenLoadCheck() async {
    emit(VisitingScreenLoadInProgress());
    final future = visitingInteractor.getListWantVisitAndVisited();
    await future.whenComplete(
      () => emit(VisitingScreenLoadInSuccess(mocksWantVisit)),
    );
  }
}
