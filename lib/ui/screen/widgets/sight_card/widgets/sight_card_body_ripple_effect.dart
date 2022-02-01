import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/screen/sight_details_screen/sight_details_screen.dart';

class SightCardBodyRippleEffect extends StatelessWidget {
  final Sight sight;

  const SightCardBodyRippleEffect(this.sight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            splashColor: ColorPalette.whiteMain.withOpacity(0.4),
            onTap: () {
              showDetailsScreen(context, sight);
              debugPrint(sight.name);
              debugPrint('Это кнопка "Вся карточка"');
            },
          ),
        ),
      ),
    );
  }

  Future<void> showDetailsScreen(
    final BuildContext context,
    final Sight _sight,
  ) async =>
      showModalBottomSheet<Widget>(
        context: context,
        builder: (final _) => SightDetailsScreen(sight: _sight),

        isScrollControlled: true,
        isDismissible: true,
        useRootNavigator: true,
      );
}
