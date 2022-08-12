 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/ui/screen/list_places_screen/bloc/list_places_events.dart';
import 'package:places/ui/screen/list_places_screen/bloc/list_places_state.dart';

class ListPlacesBloc extends Bloc<ListPlacesEvents, ListPlacesState> {
  ListPlacesBloc({
    ListPlacesState initialState = const ListPlacesState.inLoad(),
  }) : super(initialState);
}
