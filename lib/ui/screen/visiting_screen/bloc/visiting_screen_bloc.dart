import 'package:flutter_bloc/flutter_bloc.dart';

class VisitingScreenBloc extends Bloc<VisitingScreenEvent, int> {
  VisitingScreenBloc() : super(0) {
    on<VisitingSelectWantVisitTabEvent>(_onSelectWantVisitTab);
    on<VisitingSelectVisitedTabEvent>(_onSelectVisitingTab);
  }

  void _onSelectWantVisitTab(
    VisitingSelectWantVisitTabEvent event,
    Emitter<int> emit,
  ) {
    emit(0);
  }

  void _onSelectVisitingTab(
    VisitingSelectVisitedTabEvent event,
    Emitter<int> emit,
  ) {
    emit(1);
  }
}

abstract class VisitingScreenEvent {}

class VisitingSelectWantVisitTabEvent extends VisitingScreenEvent {}

class VisitingSelectVisitedTabEvent extends VisitingScreenEvent {}
