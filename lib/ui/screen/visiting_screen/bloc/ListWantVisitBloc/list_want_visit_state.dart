part of 'list_want_visit_bloc.dart';

abstract class ListWantVisitState  extends Equatable  {}

class ListWantVisitLoadState extends ListWantVisitState {
  @override
  List<Object?> get props => [];
}

class ListWantVisitLoadedState extends ListWantVisitState {
  final List<Place> listPlaceWantVisit;

  @override
  List<Object?> get props => [listPlaceWantVisit];

  ListWantVisitLoadedState(this.listPlaceWantVisit);

  @override
  String toString() {
    return 'WantVisitTabLoadInSuccess listPlaceWantVisit.length ${listPlaceWantVisit.length}';
  }
}

class ListWantVisitPlaceSelected extends ListWantVisitState {
  final List<Place> listPlaceWantVisit;

  @override
  List<Object?> get props => [listPlaceWantVisit];

  ListWantVisitPlaceSelected(this.listPlaceWantVisit);

  @override
  String toString() {
    return 'WantVisitTabLoadInSuccess listPlaceWantVisit.length ${listPlaceWantVisit.length}';
  }
}
