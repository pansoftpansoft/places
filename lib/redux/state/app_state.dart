import 'package:places/redux/state/search_places_screen_states.dart';

class AppState {
  final SearchPlacesScreenStates searchPlacesScreenStates;

  AppState({SearchPlacesScreenStates? findPlaceState})
      : searchPlacesScreenStates = findPlaceState ?? SearchPlacesScreenInitialState();

  AppState cloneWith({
    SearchPlacesScreenStates? findPlaceState,
  }) =>
      AppState(
        findPlaceState: findPlaceState ?? this.searchPlacesScreenStates,
      );
}
