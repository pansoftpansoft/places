part of 'visiting_screen_bloc.dart';

abstract class VisitingScreenEvent extends Equatable {
  const VisitingScreenEvent();
}

class VisitingScreenLoad extends VisitingScreenEvent{
  @override
  List<Object> get props => [];
}
