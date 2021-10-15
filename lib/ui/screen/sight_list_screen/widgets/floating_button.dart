import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/add_sight_screen/add_sight_screen.dart';

///
class FloatingButton extends StatelessWidget {
  ///
  const FloatingButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => DecoratedBox(
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
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (final BuildContext context) => const AddSightScreen(),
              ),
            );
          },
        ),
      );
}
