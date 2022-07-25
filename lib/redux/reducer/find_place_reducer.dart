import 'package:places/redux/action/search_places_screen_actions.dart';
import 'package:places/redux/state/app_state.dart';
import 'package:places/redux/state/search_places_screen_states.dart';

//listFoundSearchPlacesScreenReducer
AppState loadSearchPlacesScreenReducer(
  AppState state,
  dynamic action,
) {
  if (action is StartFindAction) {
    return state.cloneWith(
      findPlaceState: LoadSearchPlacesScreenState(),
    );
  }

  return state.cloneWith(
    findPlaceState: LoadSearchPlacesScreenState(),
  );
}

AppState listFoundSearchPlacesScreenReducer(
  AppState state,
  dynamic action,
) {
  return state.cloneWith(
    findPlaceState: ListFoundSearchPlacesScreenStates(),
  );
}

AppState openSearchPlacesScreenReducer(
  AppState state,
  dynamic action,
) {
  return state.cloneWith(
    findPlaceState: LoadSearchPlacesScreenState(),
  );
}

AppState showCleanScreeReducer(
  AppState state,
  dynamic action,
) {
  return state.cloneWith(
    findPlaceState: ShowCleanScreeState(),
  );
}

AppState showHistoryListScreeReducer(
  AppState state,
  dynamic action,
) {
  return state.cloneWith(
    findPlaceState: ShowHistoryListScreeState(),
  );
}

AppState showErrorScreeReducer(
  AppState state,
  dynamic action,
) {
  return state.cloneWith(
    findPlaceState: ListFoundSearchPlacesScreenStates(),
  );
}

AppState showNotFindScreeReducer(
  AppState state,
  dynamic action,
) {
  return state.cloneWith(
    findPlaceState: ShowNotFindScreeState(),
  );
}
