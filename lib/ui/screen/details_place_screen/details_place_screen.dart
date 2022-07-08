import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/data/interactor/details_place_interactor.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/details_place_screen/widgets/details_place_screen_decoration_container.dart';
import 'package:places/ui/screen/details_place_screen/widgets/details_place_screen_picture.dart';
import 'package:provider/provider.dart';

/// Подробно о достопримечательности
class DetailsPlaceScreen extends StatelessWidget {
  /// Конструктор экрана подробности о достопримечательности
  const DetailsPlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<DetailsPlaceInteractor>().index = 0;
        context.read<DetailsPlaceInteractor>().closeStream();

        return true;
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(borderRadiusCard16),
        ),
        child: Container(
          height: 650,
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          child: Stack(
            children: <Widget>[
              DetailsPlaceScreenPicture(
                context.read<DetailsPlaceInteractor>().detailsPlace!,
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
      ),
    );
  }

  void _onPressed(BuildContext context) {
    context.read<DetailsPlaceInteractor>().index = 0;
    context.read<DetailsPlaceInteractor>().closeStream();
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
