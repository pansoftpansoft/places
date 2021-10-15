import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
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
            (final BuildContext context, final AsyncSnapshot<int> snapshot) =>
                Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              youLooking,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: ColorPalette.lmFontSubtitle2
                        .withOpacity(opacityText),
                  ),
            ),
            Flexible(child: listHistory()),
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              ),
              onPressed: () {
                context.read<SearchFilterModel>().clearHistory();
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

  ///
  Widget listHistory() => Consumer<SearchFilterModel>(
        builder: (
          final BuildContext context,
          final SearchFilterModel cart,
          final Widget? child,
        ) =>
            ListView.separated(
          itemCount: SearchFilterModel.listHistory.length,
          shrinkWrap: true,
          itemBuilder: (final BuildContext context, final int index) => InkWell(
            onTap: () {
              context.read<SearchFilterModel>().searchPlaceForDynamicText(
                    SearchFilterModel.listHistory[index].historyText,
                  );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  SearchFilterModel.listHistory[index].historyText,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: ColorPalette.lmFontSubtitle2),
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    context.read<SearchFilterModel>().deleteHistory(
                          SearchFilterModel.listHistory[index].historyText,
                        );
                  },
                  child: SvgPicture.asset(
                    SvgIcons.delete,
                    height: 24,
                    color: ColorPalette.lmFontSubtitle2,
                  ),
                ),
              ],
            ),
          ),
          separatorBuilder: (final BuildContext context, final int index) =>
              const Divider(
            height: 0.8,
          ),
        ),
      );
}
