import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/filters_screen/model/filters_screen_model.dart';
import 'package:provider/provider.dart';

class AppBarTitleButtonClear extends StatelessWidget {
  const AppBarTitleButtonClear({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
    );
  }

  void _clearFilterValue(final BuildContext context) {
    for (final item in FiltersScreenModel.filterMapNew.entries) {
      FiltersScreenModel.filterMapNew[item.key] = false;
    }
    context.read<FiltersScreenModel>().notifyListenersFiltersScreen();
  }
}
