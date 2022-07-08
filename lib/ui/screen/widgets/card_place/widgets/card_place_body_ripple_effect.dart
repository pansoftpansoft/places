import 'package:flutter/material.dart';
import 'package:places/data/interactor/details_place_interactor.dart';
import 'package:places/data/interactor/list_places_screen_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/screen/details_place_screen/details_place_screen.dart';
import 'package:provider/provider.dart';

class CardPlaceBodyRippleEffect extends StatelessWidget {
  final Place place;

  const CardPlaceBodyRippleEffect(this.place, {Key? key}) : super(key: key);

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
  ) async {
    await context
        .read<DetailsPlaceInteractor>()
        .getPlace(
          place.id,
          context.read<ListPlacesScreenInteractor>().streamControllerListPlace,
        )
        .then(
          (value) => showModalBottomSheet<Widget>(
            context: context,
            builder: (_) => const DetailsPlaceScreen(),
            isScrollControlled: true,
            isDismissible: true,
            useRootNavigator: true,
          ),
        );
  }
}
