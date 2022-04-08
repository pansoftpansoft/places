import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/add_elevated_button.dart';

///Кнопка "Создать новаое место"
class BottomSheetCreateButton extends StatelessWidget {
  ///
  const BottomSheetCreateButton({
    final Key? key,
  }) : super(key: key);

  ///
  @override
  Widget build(final BuildContext context) => Container(
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: paddingPage,
            vertical: 8,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints.tightFor(height: 48),
            child: const AddElevatedButton(),
          ),
        ),
      );
}
