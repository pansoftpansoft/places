part of 'want_visit_tab_bloc.dart';


abstract class WantVisitTabState extends Equatable {
  const WantVisitTabState();
}

class WantVisitTabLoadInProgress extends WantVisitTabState {
  @override
  List<Object?> get props => [];
}

class WantVisitTabLoadInSuccess extends WantVisitTabState {
  final List<Place> listPlaceWantVisit;

  @override
  List<Object?> get props => [listPlaceWantVisit];

  const WantVisitTabLoadInSuccess(this.listPlaceWantVisit);

  @override
  String toString() {
    return 'WantVisitTabLoadInSuccess listPlaceWantVisit.length ${listPlaceWantVisit.length}';
  }
}
