import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
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

  void _onPress(BuildContext context) {
    debugPrint('Это кнопка "Построить маршрут"');
    PlaceInteractor.addToVisitingPlaces(_place);

    context.read<VisitingModel>().setPlaceIsVisit(
      _place,
    );

    //Navigator.pushNamed(context, RouteName.mapScreen);
  }
}
