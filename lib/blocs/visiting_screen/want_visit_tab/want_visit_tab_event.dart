part of 'want_visit_tab_bloc.dart';

abstract class WantVisitTabEvent extends Equatable {
  const WantVisitTabEvent();
}

class WantVisitTabLoadEvent extends WantVisitTabEvent {
  @override
  List<Object> get props => [];
}

class WantVisitTabRemovePlaceEvent extends WantVisitTabEvent {
  final Place place;

  @override
  List<Object> get props => [place];

  const WantVisitTabRemovePlaceEvent(this.place);
}

class WantVisitUpdateToVisitedEvent extends WantVisitTabEvent {
  final Place place;

  @override
  List<Object> get props => [place];

  const WantVisitUpdateToVisitedEvent(this.place);
}

// Выбор места для показа деталей о места
class WantVisitSelectedPlaceEvent extends WantVisitTabEvent {
  final Place place;

  @override
  List<Object> get props => [place];

  const WantVisitSelectedPlaceEvent(this.place);
}
