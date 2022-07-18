import 'package:flutter/material.dart';
import 'package:places/blocs/visiting_screen/want_visit_tab/want_visit_tab_bloc.dart';
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButtonGreenBig(
        title: buildRoute.toUpperCase(),
        onPressed: () {
          _onPress(context);
        },
        iconNamePrefix: Icons.gesture_outlined,
      );

  // ignore: avoid_void_async
  void _onPress(BuildContext context) {
    // так же эта кнопка переводит маршрут в посещенные
    debugPrint('Это кнопка "Построить маршрут"');
    context.read<WantVisitTabBloc>().add(WantVisitUpdateToVisited(_place));
  }
}
