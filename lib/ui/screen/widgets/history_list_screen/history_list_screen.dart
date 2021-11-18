import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:places/ui/screen/widgets/history_list_screen/list_history.dart';
import 'package:provider/provider.dart';

/// Список историй поиска мест
/// сораняет текст поиска при нажатии кнопки ентер.

class HistoryListScreen extends StatelessWidget {
  ///
  const HistoryListScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => FutureBuilder<int>(
        future: SearchFilterModel.getListHistory(),
        builder:
            (final context, final snapshot) =>
                Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              youLooking,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color:
                        ColorPalette.lmFontSubtitle2.withOpacity(opacityText),
                  ),
            ),
            const Flexible(child: ListHistory()),
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              ),
              onPressed: () {
                //context.read<SearchFilterModel>().searchPlaceForDynamicText(
                //  SearchFilterModel.listHistory[index].historyText,
                //);

                context.read<SearchFilterModel>()
                  ..searchPlaceForDynamicText('')
                  ..clearHistory()
                  ..countFilteredPlaces()
                  ..saveFilterSettings();
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
        ),
      );
}
