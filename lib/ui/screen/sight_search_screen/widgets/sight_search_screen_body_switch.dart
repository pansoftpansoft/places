import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/empty_screen.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/list_of_found_places_screen.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/load_screen.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/sight_search_screen_body_switch_not_found.dart';
import 'package:places/ui/screen/widgets/history_list_screen/history_list_screen.dart';
import 'package:provider/provider.dart';

class SightSearchScreenBodySwitch extends StatelessWidget {
  const SightSearchScreenBodySwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchFilterModel>(
      builder: (
        final context,
        final cart,
        final child,
      ) {
        switch (SearchFilterModel.selectedScreen) {
          case ScreenEnum.loadScreen:
            return const LoadScreen();
          case ScreenEnum.emptyScreen:
            return const SightSearchScreenBodySwitchNotFound();
          case ScreenEnum.listOfFoundPlacesScreen:
            return const ListOfFoundPlacesScreen();
          case ScreenEnum.historyListScreen:
            return const HistoryListScreen();
          case ScreenEnum.errorScreen:
            return EmptyScreen(
              textHeader: dataLoadingError,
              textComment: tryAgain,
              svgIcon: SvgIcons.delete,
            );
          default:
            return EmptyScreen(
              textHeader: unknownError,
              textComment: tryAgain,
              svgIcon: SvgIcons.delete,
            );
        }
      },
    );
  }
}
