import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/res/sizes.dart';

///Кнопка 'Построить маршрут'
class BuildRouteButton extends StatelessWidget {
  ///Конструктор кнопки 'Построить маршрут'
  const BuildRouteButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all<Color>(
            ColorPalette.greenColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadiusCard),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.gesture_outlined),
            Text(
              buildRoute,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: const Color(0xFFFFFFFF)),
            ),
          ],
        ),
        onPressed: () {
          if (kDebugMode) {
            print('Это кнопка "Построить маршрут"');
          }
          Navigator.pushNamed(context, RouteName.mapScreen);
        },
      );
}
