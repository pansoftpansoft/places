part of 'visited_tab_bloc.dart';

abstract class VisitedTabEvent extends Equatable {
  const VisitedTabEvent();
}

class VisitedTabLoad extends VisitedTabEvent {
  @override
  List<Object> get props => [];
}

class VisitedTabEventRemovePlace extends VisitedTabEvent {
  final Place place;

  @override
  List<Object> get props => [place];

  const VisitedTabEventRemovePlace(this.place);
}
