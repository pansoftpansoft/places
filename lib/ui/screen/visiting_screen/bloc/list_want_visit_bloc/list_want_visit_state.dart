part of 'list_want_visit_bloc.dart';

abstract class ListWantVisitState  extends Equatable  {
  const ListWantVisitState();
}

class ListWantVisitLoadState extends ListWantVisitState {
  @override
  List<Object?> get props => [];
}

class ListWantVisitLoadedState extends ListWantVisitState {
  final List<Place> listPlaceWantVisit;

  @override
  List<Object?> get props => [listPlaceWantVisit];

  const ListWantVisitLoadedState(this.listPlaceWantVisit);

  @override
  String toString() {
    return 'WantVisitTabLoadInSuccess listPlaceWantVisit.length ${listPlaceWantVisit.length}';
  }
}

class ListWantVisitPlaceSelectedState extends ListWantVisitState {
  final Place place;

  @override
  List<Object?> get props => [place];

  const ListWantVisitPlaceSelectedState(this.place);

  @override
  String toString() {
    return 'WantVisitTabLoadInSuccess listPlaceWantVisit.length ${place.name}';
  }
}
