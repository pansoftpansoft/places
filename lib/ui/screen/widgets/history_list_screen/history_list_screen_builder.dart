import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:provider/provider.dart';

import 'list_history.dart';

class HistoryListScreenBuilder extends StatelessWidget {
  const HistoryListScreenBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          youLooking,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                color: ColorPalette.lmFontSubtitle2.withOpacity(opacityText),
              ),
        ),
        const Flexible(child: ListHistory()),
        TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
          onPressed: () {
            _onPressed(context);
          },
          child: Text(
            clearHistory,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: ColorPalette.greenColor),
          ),
        ),
      ],
    );
  }

  ///Чистим всю историю и показываем только отфильтрованные места
  void _onPressed(BuildContext context) {
    context.read<SearchFilterModel>()
      ..searchPlaceForDynamicText('')
      ..clearHistory()
      ..countFilteredPlaces()
      ..getFilterSettings()
      ..managerSelectionScreen(
          numberScreen: ScreenEnum.listFoundPlacesScreen)
      ..changeSearch();
  }
}
