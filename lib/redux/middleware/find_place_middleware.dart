import 'package:places/data/interactor/search_screen_interactor.dart';
import 'package:places/redux/action/search_places_screen_actions.dart';
import 'package:places/redux/state/app_state.dart';
import 'package:places/type_place.dart';
import 'package:redux/redux.dart';

class FindPlaceMiddleware implements MiddlewareClass<AppState> {
  final SearchScreenInteractor _searchScreenInteractor;

  FindPlaceMiddleware(this._searchScreenInteractor);

  @override
  // ignore: avoid_annotating_with_dynamic
  void call(
    Store<AppState> store,
    dynamic action,
    NextDispatcher next,
  ) {
    if (action is StartFindAction) {
      _startFindAction(action.findString).then<dynamic>((value) {
        return mocksSearchText.isNotEmpty
            ? store.dispatch(ResultFindAction(mocksSearchText))
            : store.dispatch(NotResultFindAction());
      });
    }

    if (action is ShowEmptyScreeAction) {
      _searchScreenInteractor.managerSelectionScreen(
        numberScreen: ScreenEnum.cleanScreen,
      );

      // return store.dispatch(
      //   ResultFindAction(mocksSearchText),
      // );
    }

    if (action is OpenSearchPlacesScreenAction) {
      mocksSearchText.clear();

      // return SearchScreenInteractor.listHistory.isEmpty
      //     ? store.dispatch(ShowEmptyScreeAction())
      //     : store.dispatch(ShowHistoryListScreeAction());
    }

    next(action);
  }

  Future<void> _startFindAction(String findString) async {
    _searchScreenInteractor.setSearchText(findString);
    await _searchScreenInteractor.getListSearchText();
    await _searchScreenInteractor.managerSelectionScreen(
      numberScreen: ScreenEnum.listFoundPlacesScreen,
    );
    await _searchScreenInteractor.changeSearch();
  }
}
