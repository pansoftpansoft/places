import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:places/data/interactor/search_screen_interactor.dart';
import 'package:places/redux/action/search_places_screen_actions.dart';
import 'package:places/redux/state/app_state.dart';
import 'package:places/redux/state/search_places_screen_states.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/search_places_screen/widgets/empty_screen.dart';
import 'package:places/ui/screen/search_places_screen/widgets/list_found_places_screen.dart';
import 'package:places/ui/screen/search_places_screen/widgets/load_screen.dart';
import 'package:places/ui/screen/search_places_screen/widgets/search_places_screen_body_switch_not_found.dart';
import 'package:places/ui/screen/widgets/history_list_screen/list_history_screen.dart';
import 'package:provider/provider.dart';

class SearchPlacesScreenBodySwitch extends StatelessWidget {
  const SearchPlacesScreenBodySwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SearchPlacesScreenStates>(
      onInit: (store) async {
        StoreProvider.of<AppState>(context).dispatch(
          OpenSearchPlacesScreenAction(),
        );
      },
      converter: (store) {
        return store.state.searchPlacesScreenStates;
      },
      builder: (
        context,
        state,
      ) {
        debugPrint(
          'context.read<SearchScreenInteractor>().selectedScreen '
          '= ${context.read<SearchScreenInteractor>().selectedScreen}',
        );

        debugPrint(
          'state '
          '= ${state.toString()}',
        );

        if (state is ListFoundSearchPlacesScreenStates) {
          return const ListFoundPlacesScreen();
        } else if (state is LoadSearchPlacesScreenState) {
          return const LoadScreen();
        } else if (state is EmptySearchPlacesScreenState) {
          return const SearchPlacesScreenBodySwitchNotFound();
        } else if (state is ShowCleanScreeState) {
          return const EmptyScreen(
            textHeader: insertText,
            textComment: '',
            svgIcon: SvgIcons.info,
          );
        } else if (state is ShowHistoryListScreeState) {
          return const ListHistoryScreen();
        } else if (state is ShowNotFindScreeState) {
          return const SearchPlacesScreenBodySwitchNotFound();
        } else {
          return const EmptyScreen(
            textHeader: unknownError,
            textComment: tryAgain,
            svgIcon: SvgIcons.delete,
          );
        }
      },
    );
  }
}
