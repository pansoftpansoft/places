import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/loader_size.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/details_place_screen/bloc/details_place_bloc.dart';
import 'package:places/ui/screen/details_place_screen/widgets/details_place_screen_decoration_container.dart';
import 'package:places/ui/screen/details_place_screen/widgets/details_place_screen_picture.dart';
import 'package:places/ui/screen/widgets/loader.dart';

/// Подробно о достопримечательности
class DetailsPlaceScreen extends StatelessWidget {
  /// Конструктор экрана подробности о достопримечательности
  const DetailsPlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DetailsPlaceBloc, DetailsPlaceState>(
          listenWhen: (previousState, state) => state.loaded,
          listener: (context, state) {
            debugPrint('DetailsPlace все загрузили, ждем новых событий!');

            return;
          },
        ),
      ],
      child: BlocBuilder<DetailsPlaceBloc, DetailsPlaceState>(
        builder: (context, state) {
          debugPrint('1111111111111@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
          debugPrint(state.load.toString());

          return state.load
              ? const Padding(
                  padding: EdgeInsets.only(
                    top: heightSizeBox12,
                    bottom: iconSize29,
                  ),
                  child: Loader(LoaderSize.small),
                )
              : ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(borderRadiusCard16),
                  ),
                  child: Container(
                    height: 650,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .backgroundColor,
                    child: Stack(
                      children: <Widget>[
                        DetailsPlaceScreenPicture(
                          state.place!,
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
        },
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
