import 'package:flutter/material.dart';
import 'package:places/data/interactor/search_screen_interactor.dart';
import 'package:places/type_place.dart';
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

    return Consumer<SearchScreenInteractor>(
      builder: (
        final context,
        final card,
        final child,
      ) {
        switch (context.read<SearchScreenInteractor>().selectedScreen) {
          case ScreenEnum.loadScreen:
            return const LoadScreen();
          case ScreenEnum.emptyScreen:
            return const SearchPlacesScreenBodySwitchNotFound();
          case ScreenEnum.cleanScreen:
            return const EmptyScreen(
              textHeader: insertText,
              textComment: '',
              svgIcon: SvgIcons.info,
            );
          case ScreenEnum.listFoundPlacesScreen:
            return const ListFoundPlacesScreen();
          case ScreenEnum.listSearchWords:
            return const ListHistoryScreen();
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
