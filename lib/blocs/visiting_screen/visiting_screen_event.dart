part of 'visiting_screen_bloc.dart';

abstract class VisitingScreenEvent extends Equatable {
  const VisitingScreenEvent();
}

class VisitingScreenLoad extends VisitingScreenEvent {
  @override
  List<Object> get props => [];
}

class VisitingScreenRemovePlace extends VisitingScreenEvent {
  final Place place;

  @override
  List<Object> get props => [place];

  const VisitingScreenRemovePlace(this.place);
}
