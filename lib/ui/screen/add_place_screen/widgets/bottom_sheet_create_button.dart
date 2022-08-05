import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/add_place_screen/add_place_screen_widget_model.dart';
import 'package:places/ui/screen/add_place_screen/widgets/button_create.dart';

///Кнопка "Создать новаое место"
class BottomSheetCreateButton extends StatelessWidget {
  ///
  ///
  final IAddPlaceScreenWidgetModel wm;

  const BottomSheetCreateButton({
    required this.wm,
    final Key? key,
  }) : super(key: key);

  ///
  @override
  Widget build(BuildContext context) {

    return ColoredBox(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: paddingPage,
          vertical: 8,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(height: 48),
          child: const ButtonCreate(),
        ),
      ),
    );
  }
}
