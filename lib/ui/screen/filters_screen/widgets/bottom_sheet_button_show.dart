import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/'
    'sight_search_screen/models/search_filter_model.dart';
import 'package:provider/provider.dart';

///Кнопка "показать"
class BottomSheetButtonShow extends StatelessWidget {
  ///Кнопка "показать"
  const BottomSheetButtonShow({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Consumer<SearchFilterModel>(
      builder: (
        final context,
        final cart,
        final child,
      ) =>
          Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: paddingPage,
          vertical: paddingPage_2,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(height: heightSizeBox48),
          child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$show (${SearchFilterModel.countPlace})',
                ),
              ],
            ),
            onPressed: SearchFilterModel.countPlace != 0
                ? () {
                    _onPressed(context);
                  }
                : null,
          ),
        ),
      ),
    );
  }

  void _onPressed(BuildContext context) {
    context.read<SearchFilterModel>()
      ..setSearchText('')
      ..saveFilterSettings()
      ..setFilteredPlaces()
      ..getFilteredList()
      ..managerSelectionScreen(numberScreen: ScreenEnum.listFoundPlacesScreen)
      ..countFilteredPlacesSet();

    Navigator.pop(context);
  }
}
