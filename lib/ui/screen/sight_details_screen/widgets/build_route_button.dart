import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/screen/widgets/elevated_button_green_big.dart';

///Кнопка 'Построить маршрут'
class BuildRouteButton extends StatelessWidget {
  ///Конструктор кнопки 'Построить маршрут'
  const BuildRouteButton({
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
    Navigator.pushNamed(context, RouteName.mapScreen);
  }
}
