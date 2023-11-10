import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/visiting_screen/bloc/list_want_visit_bloc/list_want_visit_bloc.dart';
import 'package:places/ui/screen/widgets/elevated_button_green_big.dart';

///Кнопка 'Построить маршрут'
class BuildRouteButton extends StatelessWidget {
  final Place _place;

  ///Конструктор кнопки 'Построить маршрут'
  const BuildRouteButton(
    this._place, {
    Key? key,
  }) : super(key: key);

  @override
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

    context.read<ListWantVisitBloc>().add(
          ListWantVisitUpdateDateEvent(
            _place.copyWith(
                visitedDate: DateTime.now(),
                isFavorites: false,
            ),
          ),
        );
    context.read<ListWantVisitBloc>().add(
          ListWantVisitPlaceUpdateToVisitedEvent(
            _place.copyWith(
              visitedDate: DateTime.now(),
              isFavorites: false,
            ),
          ),
        );
  }
}
