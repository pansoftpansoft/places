part of 'visiting_screen_bloc.dart';

abstract class VisitingScreenState extends Equatable {
  const VisitingScreenState();
}

class VisitingScreenLoadInProgress extends VisitingScreenState {
  @override
  List<Object?> get props => [];
}

class VisitingScreenLoadInSuccess extends VisitingScreenState {
  final List<Place> listPlaceWantVisit;

  @override
  List<Object?> get props => [listPlaceWantVisit];

  const VisitingScreenLoadInSuccess(this.listPlaceWantVisit);

  @override
  String toString() {
    return 'VisitingScreenState $listPlaceWantVisit';
  }
}
