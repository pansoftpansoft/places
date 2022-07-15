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
  final List<Place> listPlaceVisited;

  @override
  List<Object?> get props => [listPlaceWantVisit, listPlaceVisited];

  const VisitingScreenLoadInSuccess(
      this.listPlaceWantVisit, this.listPlaceVisited,);

  @override
  String toString() {
    return 'VisitingScreenState $listPlaceWantVisit';
  }
}
