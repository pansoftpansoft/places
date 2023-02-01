part of 'list_visited_bloc.dart';

abstract class ListVisitedState extends Equatable {
  const ListVisitedState();
}

class ListVisitedLoadState extends ListVisitedState {
  @override
  List<Object?> get props => [];
}

class ListVisitedLoadedState extends ListVisitedState {
  final List<Place> listPlaceVisited;

  @override
  List<Object?> get props => [listPlaceVisited];

  const ListVisitedLoadedState(this.listPlaceVisited);

  @override
  String toString() {
    return 'VisitedTabLoadInSuccess $listPlaceVisited';
  }
}

class ListVisitedPlaceSelectedState extends ListVisitedState {
  final Place placeVisit;

  @override
  List<Object?> get props => [placeVisit];

  const ListVisitedPlaceSelectedState(this.placeVisit);

  @override
  String toString() {
    return 'VisitedTabSelected $placeVisit';
  }
}
