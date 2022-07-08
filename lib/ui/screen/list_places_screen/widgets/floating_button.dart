import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/res/svg_icons.dart';

///Кнопка добавления нового места
class FloatingButton extends StatelessWidget {
  ///
  const FloatingButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              ColorPalette.greenColorLightGradient,
              ColorPalette.greenColorStrongGradient,
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: FloatingActionButton.extended(
          elevation: 0,
          backgroundColor: Colors.transparent,
          icon: SvgPicture.asset(
            SvgIcons.plus,
          ),
          label: Text(newPlace.toUpperCase()),
          onPressed: () {
            Navigator.pushNamed(context, RouteName.addPlaceScreen);
          },
        ),
      );
}
