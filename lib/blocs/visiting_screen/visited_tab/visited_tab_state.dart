part of 'visited_tab_bloc.dart';


abstract class VisitedTabState extends Equatable {
  const VisitedTabState();
}

class VisitedTabLoadInProgress extends VisitedTabState {
  @override
  List<Object?> get props => [];
}

class VisitedTabLoadInSuccess extends VisitedTabState {
  final List<Place> listPlaceWantVisit;

  @override
  List<Object?> get props => [listPlaceWantVisit];

  const VisitedTabLoadInSuccess(this.listPlaceWantVisit);

  @override
  String toString() {
    return 'WantVisitTabLoadInSuccess $listPlaceWantVisit';
  }
}
