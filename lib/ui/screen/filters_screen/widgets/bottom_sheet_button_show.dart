import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/filters_screen/model/filters_screen_model.dart';
import 'package:places/ui/screen/widgets/elevated_button_green_big.dart';
import 'package:provider/provider.dart';

///Кнопка "показать"
class BottomSheetButtonShow extends StatelessWidget {
  ///Кнопка "показать"
  const BottomSheetButtonShow({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Consumer<FiltersScreenModel>(
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
          child: ElevatedButtonGreenBig(
            title: '$show (${mocks.length})',
            onPressed: mocks.isNotEmpty
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
    context.read<FiltersScreenModel>().saveFilterSettings();
    Navigator.pop(context);
  }
}
