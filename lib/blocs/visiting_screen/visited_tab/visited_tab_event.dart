part of 'visited_tab_bloc.dart';

abstract class VisitedTabEvent extends Equatable {
  const VisitedTabEvent();
}

class VisitedTabLoadEvent extends VisitedTabEvent {
  @override
  List<Object> get props => [];
}

class VisitedTabRemovePlaceEvent extends VisitedTabEvent {
  final Place place;

  @override
  List<Object> get props => [place];

  const VisitedTabRemovePlaceEvent(this.place);
}

class VisitedTabSelectedPlaceEvent extends VisitedTabEvent {
  final Place place;

  @override
  List<Object> get props => [];

  const VisitedTabSelectedPlaceEvent(this.place);
}

class VisitedTabNewSelectedPlaceEvent extends VisitedTabEvent {
  final Place place;

  @override
  List<Object> get props => [];

  const VisitedTabNewSelectedPlaceEvent(this.place);
}
