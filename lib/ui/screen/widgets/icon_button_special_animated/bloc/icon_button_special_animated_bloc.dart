import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'icon_button_special_animated_event.dart';

part 'icon_button_special_animated_state.dart';

class IconButtonSpecialAnimatedBloc extends Bloc<IconButtonSpecialAnimatedEvent,
    IconButtonSpecialAnimatedState> {
  IconButtonSpecialAnimatedBloc()
      : super(IconButtonSpecialAnimatedLoadState()) {
    on<IconButtonSpecialAnimatedLoadEvent>(_onIconButtonSpecialAnimatedLoad);
    on<IconButtonSpecialAnimatedSetEvent>(_onIconButtonSpecialAnimatedSet);
    on<IconButtonSpecialAnimatedChangeEvent>(
      _onIconButtonSpecialAnimatedChange,
    );
  }

  Future<void> _onIconButtonSpecialAnimatedLoad(
    IconButtonSpecialAnimatedLoadEvent event,
    Emitter<IconButtonSpecialAnimatedState> emit,
  ) async {
    emit(
      const IconButtonSpecialAnimatedSetFalseState(
        show: false,
      ),
    );
  }

  Future<void> _onIconButtonSpecialAnimatedSet(
    IconButtonSpecialAnimatedSetEvent event,
    Emitter<IconButtonSpecialAnimatedState> emit,
  ) async {
    emit(
      IconButtonSpecialAnimatedSetTrueState(show: event.show),
    );
  }

  Future<void> _onIconButtonSpecialAnimatedChange(
    IconButtonSpecialAnimatedChangeEvent event,
    Emitter<IconButtonSpecialAnimatedState> emit,
  ) async {
    if (event.show) {
      emit(
        const IconButtonSpecialAnimatedSetFalseState(show: false),
      );
    } else {
      emit(
        const IconButtonSpecialAnimatedSetTrueState(show: true),
      );
    }
  }
}
