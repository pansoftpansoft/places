import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_screen_model.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/empty_screen.dart';
import 'package:places/ui/screen/sight_search_screen/widgets/list_found_places_screen.dart';
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

    return Consumer<SearchScreenModel>(
      builder: (
        final context,
        final cart,
        final child,
      ) {
        debugPrint('SightSearchScreenBodySwitch ${SearchScreenModel.selectedScreen}');
        switch (SearchScreenModel.selectedScreen) {
          case ScreenEnum.loadScreen:
            return const LoadScreen();
          case ScreenEnum.emptyScreen:
            return const SightSearchScreenBodySwitchNotFound();
          case ScreenEnum.cleanScreen:
            return const EmptyScreen(
              textHeader: insertText,
              textComment: '',
              svgIcon: SvgIcons.info,
            );
          case ScreenEnum.listFoundPlacesScreen:
            return const ListFoundPlacesScreen();
          case ScreenEnum.listSearchWords:
            return const HistoryListScreen();
          case ScreenEnum.errorScreen:
            return const EmptyScreen(
              textHeader: dataLoadingError,
              textComment: tryAgain,
              svgIcon: SvgIcons.delete,
            );
          default:
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
