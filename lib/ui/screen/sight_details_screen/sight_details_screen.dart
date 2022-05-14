import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/sight_details_screen/models/sight_details_model.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/sight_details_screen_decoration_container.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/sight_details_screen_picture.dart';
import 'package:provider/provider.dart';

/// Подробно о достопримечательности
class SightDetailsScreen extends StatelessWidget {
  /// Конструктор экрана подробности о достопримечательности
  const SightDetailsScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(borderRadiusCard16),
      ),
      child: Container(
        height: 650,
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        child: Stack(
          children: <Widget>[
            SightDetailsScreenPicture(
              context.read<SightDetailsModel>().placeDetails!,
            ),
            const SightDetailsScreenDecorationContainer(),
            Positioned(
              right: 16,
              top: 16,
              child: ElevatedButton(
                onPressed: () {
                  _onPressed(context);
                },
                style: _buttonStyle(),
                child: SvgPicture.asset(
                  SvgIcons.delete,
                  color: ColorPalette.whiteMain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressed(BuildContext context) {
    SightDetailsModel.index = 0;
    Navigator.of(context).pop();
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      minimumSize: const Size(40, 40),
      elevation: 0,
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(8),
      primary: ColorPalette.whiteColor,
      onPrimary: ColorPalette.whiteMain,
    );
  }
}
