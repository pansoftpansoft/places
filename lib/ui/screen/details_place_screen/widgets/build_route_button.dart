import 'package:flutter/material.dart';
import 'package:places/data/interactor/list_places_screen_model.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/interactor/visiting_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/widgets/elevated_button_green_big.dart';
import 'package:provider/provider.dart';

///Кнопка 'Построить маршрут'
class BuildRouteButton extends StatelessWidget {
  final Place _place;

  ///Конструктор кнопки 'Построить маршрут'
  const BuildRouteButton(
    this._place, {
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => ElevatedButtonGreenBig(
        title: buildRoute.toUpperCase(),
        onPressed: () {
          _onPress(context);
        },
        iconNamePrefix: Icons.gesture_outlined,
      );

  // ignore: avoid_void_async
  void _onPress(BuildContext context) async {
    // так же эта кнопка переводит маршрут в посещенные
    debugPrint('Это кнопка "Построить маршрут"');
    await context.read<PlaceInteractor>().setStatusPlaceVisited(_place,
    context.read<ListPlacesScreenModel>().streamControllerListPlace,);
    // ignore: use_build_context_synchronously
    context.read<VisitingInteractor>().updateScreen();
    //Navigator.pushNamed(context, RouteName.mapScreen);
  }
}
