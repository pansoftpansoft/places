import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/filters_screen/filters_screen.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';


///
class TitleFilter extends StatelessWidget {
  ///
  const TitleFilter({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            onPressed: () {
              _clearFilterValue(context);
            },
            child: const Text(
              clear,
              style: TextStyle(
                fontSize: 16,
                color: ColorPalette.greenColor,
              ),
            ),
          ),
        ],
      );

  void _clearFilterValue(final BuildContext context) {
    for (final MapEntry<TypePlace, bool> item
        in SearchFilterModel.filterMap.entries) {
      SearchFilterModel.filterMap[item.key] = false;
    }
    FiltersScreen.setFilter(context);
  }
}
