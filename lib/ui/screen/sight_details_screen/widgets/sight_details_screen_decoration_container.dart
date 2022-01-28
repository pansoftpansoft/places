import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/svg_icons.dart';

class SightDetailsScreenDecorationContainer extends StatelessWidget {
  const SightDetailsScreenDecorationContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50,
            width: 390,
            child: Container(
              alignment: Alignment.center,
              color: Colors.transparent,
              child: SvgPicture.asset(
                SvgIcons.rectangle1303,
                color: ColorPalette.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
