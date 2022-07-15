import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/type_place.dart';

part 'visiting_screen_event.dart';
part 'visiting_screen_state.dart';



class VisitingScreenBloc  extends Bloc<VisitingScreenEvent, VisitingScreenState> {
  final VisitingInteractor visitingInteractor;

  VisitingScreenBloc(this.visitingInteractor)
      : super(VisitingScreenLoadInProgress());

  @override
  Stream<VisitingScreenState> mapEventToState(
    VisitingScreenEvent event,
  ) async* {
    yield VisitingScreenLoadInSuccess(mocksWantVisit, mocksVisited);
  }

  // VisitingScreenState _mapLoad1() {
  //   visitingInteractor.getListWantVisitAndVisited().then((value) => null);
  //
  //   return VisitingScreenLoadInSuccess(mocksWantVisit, mocksVisited);
  // }
}
