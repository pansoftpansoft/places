import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:places/ui/screen/sight_list_screen/models/sight_list_screen_model.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/bottom_sheet_create_button_row.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/add_elevated_button.dart';
import 'package:places/ui/screen/sight_list_screen/models/sight_list_screen_model.dart';
import 'package:provider/provider.dart';

///Кнопка "Создать"
class BottomSheetCreateButton extends StatelessWidget {
  ///
  const BottomSheetCreateButton({
    final Key? key,
  }) : super(key: key);

  ///
  @override
  Widget build(final BuildContext context) =>
      Consumer<AddSightModel>(
        builder: (final context,
            final sight,
            final child,) =>
            Container(
              color: Theme
                  .of(context)
                  .backgroundColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: paddingPage,
                  vertical: 8,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(height: 48),
                  child: AddElevatedButton(),
                ),
              ),
            ),
      );


}
