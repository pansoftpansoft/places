import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/'
    'sight_search_screen/models/search_filter_model.dart';
import 'package:provider/provider.dart';

///Текст кнопки "Показать"
class BottomSheetButtonShowText extends StatelessWidget {
  ///Текст кнопки "Показать"
  const BottomSheetButtonShowText({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Consumer<SearchFilterModel>(
      builder: (
        final context,
        final cart,
        final child,
      ) =>
          Text(
        '$show (${SearchFilterModel.countPlace})',
        style: _textStyle(context),
      ),
    );
  }

  TextStyle _textStyle(BuildContext context) {

    return Theme.of(context).textTheme.headline5!.copyWith(
          color: ColorPalette.lmPrimaryColor,
        );
  }
}
