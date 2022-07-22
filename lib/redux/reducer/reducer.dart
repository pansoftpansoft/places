import 'package:places/redux/action/search_places_screen_actions.dart';
import 'package:places/redux/reducer/find_place_reducer.dart';
import 'package:places/redux/state/app_state.dart';
import 'package:redux/redux.dart';


final reducer = combineReducers<AppState>([
  TypedReducer<AppState, StartFindAction>(loadSearchPlacesScreenReducer),
  TypedReducer<AppState, ResultFindAction>(listFoundSearchPlacesScreenReducer),
  TypedReducer<AppState, OpenSearchPlacesScreenAction>(openSearchPlacesScreenReducer),
  TypedReducer<AppState, ShowCleanScreeAction>(showCleanScreeReducer),
  TypedReducer<AppState, ShowHistoryListScreeAction>(showHistoryListScreeReducer),
  TypedReducer<AppState, NotResultFindAction>(showNotFindScreeReducer),
]);
