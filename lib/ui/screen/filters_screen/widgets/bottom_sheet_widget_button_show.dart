import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:provider/provider.dart';

///Кнопка "показать"
class BottomSheetWidgetButtonShow extends StatelessWidget {
  ///
  const BottomSheetWidgetButtonShow({final Key? key}) : super(key: key);

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
          vertical: paddingPage / 2,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(height: 48),
          child: ElevatedButton(
            style: _buildButtonStyle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$show (${SearchFilterModel.countPlace})',
                  style: _textStyle(context),
                ),
              ],
            ),
            onPressed: () {
              SearchFilterModel.countPlace == 0
                  // ignore: unnecessary_statements
                  ? null
                  : _onPressed(
                      context,
                    );
              //Записываем состояние фильтра
            },
          ),
        ),
      ),
    );
  }

  ButtonStyle _buildButtonStyle() {
    return ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      elevation: MaterialStateProperty.all(0),
      backgroundColor: SearchFilterModel.countPlace == 0
          ? MaterialStateProperty.all<Color>(ColorPalette.dmBasicColor)
          : MaterialStateProperty.all<Color>(ColorPalette.greenColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadiusCard16),
          ),
        ),
      ),
    );
  }

  TextStyle _textStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline5!.copyWith(
          color: ColorPalette.lmPrimaryColor,
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
