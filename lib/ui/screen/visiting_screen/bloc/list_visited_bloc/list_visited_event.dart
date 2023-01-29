part of 'list_visited_bloc.dart';

abstract class ListVisitedEvent extends Equatable {
  const ListVisitedEvent();
}

class ListVisitedLoadEvent extends ListVisitedEvent {
  @override
  List<Object> get props => [];
}

class ListVisitedLoadedEvent extends ListVisitedEvent {
  @override
  List<Object> get props => [];
}
class ListVisitedRemovePlaceEvent extends ListVisitedEvent {
  final Place place;

  @override
  List<Object> get props => [place];

  const ListVisitedRemovePlaceEvent(this.place);
}

class ListVisitedSelectPlaceEvent extends ListVisitedEvent {
  final Place place;

  @override
  List<Object> get props => [place];

  const ListVisitedSelectPlaceEvent(this.place);
}
