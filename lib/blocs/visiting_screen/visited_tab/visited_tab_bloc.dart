// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/type_place.dart';

part 'visited_tab_event.dart';

part 'visited_tab_state.dart';


class VisitedTabBloc
    extends Bloc<VisitedTabEvent, VisitedTabState> {
  final VisitingInteractor visitingInteractor;

  VisitedTabBloc(this.visitingInteractor)
      : super(VisitedTabLoadInProgress()) {
    ///Обработка события загрузка экрана
    on<VisitedTabLoad>(
      (event, emit) async {
        await _visitedTabBLoadCheck();
      },
    );

    ///Обработка события удаление меств из списка "Посещенные"
    on<VisitedTabEventRemovePlace>(
      (event, emit) async {
        await _visitedTabRemovePlace(event);
      },
    );
  }

  Future<void> _visitedTabBLoadCheck() async {
    debugPrint(' до загрузки');
    emit(VisitedTabLoadInProgress());
    debugPrint(' после загрузки');
    final future = visitingInteractor.getListWantVisitAndVisited();
    await future.whenComplete(
      () => emit(
        VisitedTabLoadInSuccess(mocksVisited),
      ),
    );
  }

  Future<void> _visitedTabRemovePlace(
      VisitedTabEventRemovePlace event,
  ) async {
    debugPrint('visitedTabRemovePlace = 1');
    final future = visitingInteractor.deletePlaceVisited(event.place);
    await future.whenComplete(
      () => emit(
        VisitedTabLoadInSuccess(mocksVisited),
      ),
    );
    debugPrint('visitedTabRemovePlace = 2');
  }
}
