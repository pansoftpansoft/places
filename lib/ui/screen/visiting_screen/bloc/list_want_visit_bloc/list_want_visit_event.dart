part of 'list_want_visit_bloc.dart';

abstract class ListWantVisitEvent extends Equatable {
  const ListWantVisitEvent();
}

class ListWantVisitLoadEvent extends ListWantVisitEvent {
  @override
  List<Object> get props => [];
}

class ListWantVisitLoadedEvent extends ListWantVisitEvent {
  @override
  List<Object> get props => [];
}

class ListWantVisitRemovePlaceEvent extends ListWantVisitEvent {
  final Place place;

  @override
  List<Object> get props => [place];

  const ListWantVisitRemovePlaceEvent(this.place);
}

class ListWantVisitSelectPlaceEvent extends ListWantVisitEvent {
  final Place place;

  @override
  List<Object> get props => [place];

  const ListWantVisitSelectPlaceEvent(this.place);
}


class ListWantVisitUpdateDateEvent extends ListWantVisitEvent {
  final Place place;


  @override
  List<Object> get props => [place];

  const ListWantVisitUpdateDateEvent(this.place);
}

class ListWantVisitPlaceUpdateToVisitedEvent extends ListWantVisitEvent {
  final Place place;

  @override
  List<Object> get props => [place];

  const ListWantVisitPlaceUpdateToVisitedEvent(this.place);
}
