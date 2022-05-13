import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/screen/sight_details_screen/sight_details_screen.dart';

class SightCardBodyRippleEffect extends StatelessWidget {
  final Place place;

  const SightCardBodyRippleEffect(this.place, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            splashColor: ColorPalette.whiteMain.withOpacity(0.4),
            onTap: () {
              showDetailsScreen(context, place);
              debugPrint(place.name);
              debugPrint('Это кнопка "Вся карточка"');
            },
          ),
        ),
      ),
    );
  }

  Future<void> showDetailsScreen(
    final BuildContext context,
    final Place place,
  ) async =>
      showModalBottomSheet<Widget>(
        context: context,
        builder: (final _) => SightDetailsScreen(place: place),

        isScrollControlled: true,
        isDismissible: true,
        useRootNavigator: true,
      );
}
