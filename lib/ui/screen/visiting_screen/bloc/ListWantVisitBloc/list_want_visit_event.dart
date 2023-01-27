part of 'list_want_visit_bloc.dart';

abstract class ListWantVisitEvent extends Equatable {
  const ListWantVisitEvent();
}

class WantVisitLoadEvent extends ListWantVisitEvent {
  @override
  List<Object> get props => [];
}

class WantVisitLoadedEvent extends ListWantVisitEvent {
  @override
  List<Object> get props => [List<Place>];
}

class WantVisitRemovePlaceEvent extends ListWantVisitEvent {
  final Place place;

  @override
  List<Object> get props => [place];

  const WantVisitRemovePlaceEvent(this.place);
}

class WantVisitSelectPlaceEvent extends ListWantVisitEvent {
  final Place place;

  @override
  List<Object> get props => [place];

  const WantVisitSelectPlaceEvent(this.place);
}


class WantVisitUpdateDateEvent extends ListWantVisitEvent {
  final Place place;
  final DateTime newDate;

  @override
  List<Object> get props => [place];

  const WantVisitUpdateDateEvent(this.place, this.newDate);
}
