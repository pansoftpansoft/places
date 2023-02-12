import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/details_place_screen/bloc/details_place_bloc.dart';
import 'package:places/ui/screen/details_place_screen/widgets/details_place_screen_decoration_container.dart';
import 'package:places/ui/screen/details_place_screen/widgets/details_place_screen_picture.dart';

/// Подробно о достопримечательности
class DetailsPlaceScreen extends StatelessWidget {
  final Place? place;

  /// Конструктор экрана подробности о достопримечательности
  const DetailsPlaceScreen({this.place, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<DetailsPlaceBloc>().add(
          DetailsPlaceEvents.onLoaded(
            place: place,
            index: 0,
            isFavorites: !place!.isFavorites,
            wantVisitDate: place!.wantVisitDate.toString().length > 9
                ? place!.wantVisitDate.toString().substring(0, 10) ==
                        '1970-01-01'
                    ? null
                    : place!.wantVisitDate
                : null,
          ),
        );

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(borderRadiusCard16),
      ),
      child: Container(
        height: 650,
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        child: Stack(
          children: <Widget>[
            DetailsPlaceScreenPicture(
              place!,
            ),
            const DetailsPlaceScreenDecorationContainer(),
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
