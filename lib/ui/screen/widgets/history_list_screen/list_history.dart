import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:provider/provider.dart';

///
class ListHistory extends StatelessWidget {
  ///
  const ListHistory({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Consumer<SearchFilterModel>(
        builder: (
          final context,
          final cart,
          final child,
        ) =>
            ListView.separated(
          itemCount: SearchFilterModel.listHistory.length,
          shrinkWrap: true,
          itemBuilder: (final context, final index) => InkWell(
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
          separatorBuilder: (final context, final index) => const Divider(
            height: 0.8,
          ),
        ),
      );
}
