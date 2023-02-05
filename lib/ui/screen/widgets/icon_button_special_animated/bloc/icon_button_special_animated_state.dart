part of 'icon_button_special_animated_bloc.dart';

abstract class IconButtonSpecialAnimatedState extends Equatable {
  const IconButtonSpecialAnimatedState();
}

class IconButtonSpecialAnimatedLoadState
    extends IconButtonSpecialAnimatedState {
  @override
  List<Object?> get props => [];
}

class IconButtonSpecialAnimatedSetTrueState
    extends IconButtonSpecialAnimatedState {
  final bool show;

  @override
  List<Object?> get props => [show];

  const IconButtonSpecialAnimatedSetTrueState({required this.show});

  @override
  String toString() {
    return 'isFavorite = ${show.toString()}';
  }
}

class IconButtonSpecialAnimatedSetFalseState
    extends IconButtonSpecialAnimatedState {
  final bool show;

  @override
  List<Object?> get props => [show];

  const IconButtonSpecialAnimatedSetFalseState({required this.show});

  @override
  String toString() {
    return 'isFavorite = ${show.toString()}';
  }
}
