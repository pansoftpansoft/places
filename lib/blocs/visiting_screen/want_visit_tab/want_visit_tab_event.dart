part of 'want_visit_tab_bloc.dart';

abstract class WantVisitTabEvent extends Equatable {
  const WantVisitTabEvent();
}

class WantVisitTabLoad extends WantVisitTabEvent {
  @override
  List<Object> get props => [];
}

class WantVisitTabRemovePlace extends WantVisitTabEvent {
  final Place place;

  @override
  List<Object> get props => [place];

  const WantVisitTabRemovePlace(this.place);
}

class WantVisitUpdateToVisited extends WantVisitTabEvent {
  final Place place;

  @override
  List<Object> get props => [place];

  const WantVisitUpdateToVisited(this.place);
}
