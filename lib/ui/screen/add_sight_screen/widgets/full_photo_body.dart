import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:provider/provider.dart';

class FullPhotoBody extends StatelessWidget {
  final int index;

  const FullPhotoBody(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: heightSizeBox72,
      height: heightSizeBox72,
      decoration: buildBoxDecoration(),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 20,
            child: SvgPicture.asset(
              SvgIcons.hotel,
              height: iconSize50,
              color: ColorPalette.greenColor,
            ),
          ),
          Positioned(
            right: 8,
            top: 2,
            child: InkWell(
              onTap: () {
                _onTap(context, index);
              },
              child: SvgPicture.asset(
                SvgIcons.clearWhite,
                height: iconSize20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      color: ColorPalette.dmPrimaryColor,
      border: Border.all(color: ColorPalette.greenColor, width: 3),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    );
  }

  void _onTap(final BuildContext context, int index) {
    context.read<AddSightModel>().deletePhoto(index);
  }
}
