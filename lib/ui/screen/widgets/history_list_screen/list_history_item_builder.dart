import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:provider/src/provider.dart';

class ListHistoryItemBuilder extends StatelessWidget {
  final int index;

  const ListHistoryItemBuilder(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _onTap(index, context);
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
              _onTap(index, context);
            },
            child: SvgPicture.asset(
              SvgIcons.delete,
              height: 24,
              color: ColorPalette.lmFontSubtitle2,
            ),
          ),
        ],
      ),
    );
  }

  void _onTap(
    int index,
    BuildContext context,
  ) {
    context.read<SearchFilterModel>().searchPlaceForDynamicText(
          SearchFilterModel.listHistory[index].historyText,
        );
  }
}
