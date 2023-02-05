part of 'icon_button_special_animated_bloc.dart';

abstract class IconButtonSpecialAnimatedEvent extends Equatable {
  const IconButtonSpecialAnimatedEvent();
}

class IconButtonSpecialAnimatedLoadEvent extends IconButtonSpecialAnimatedEvent {
  final bool show;

  @override
  List<Object?> get props => [show];

  const IconButtonSpecialAnimatedLoadEvent({required this.show});
}

class IconButtonSpecialAnimatedSetEvent extends IconButtonSpecialAnimatedEvent {
  final bool show;

  @override
  List<Object?> get props => [show];

  const IconButtonSpecialAnimatedSetEvent({required this.show});

  @override
  String toString() {
    return 'isFavorite = ${show.toString()}';
  }
}

class IconButtonSpecialAnimatedChangeEvent extends IconButtonSpecialAnimatedEvent {
  final bool show;

  @override
  List<Object?> get props => [show];

  const IconButtonSpecialAnimatedChangeEvent({required this.show});

  @override
  String toString() {
    return 'isFavorite = ${show.toString()}';
  }
}
