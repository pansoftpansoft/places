import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:provider/provider.dart';

/// Отображение фотографии
class FullPhoto extends StatefulWidget {
  ///
  final int index;

  ///
  const FullPhoto(
    this.index, {
    final Key? key,
  }) : super(key: key);

  @override
  State<FullPhoto> createState() => _FullPhotoState();
}

class _FullPhotoState extends State<FullPhoto> {
  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Dismissible(
          direction: DismissDirection.up,
          onDismissed: (final direction) {
            context.read<AddSightModel>().deletePhoto(widget.index);
          },
          key: UniqueKey(),
          child: Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: ColorPalette.dmPrimaryColor,
              border: Border.all(color: ColorPalette.greenColor, width: 3),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  top: 20,
                  child: SvgPicture.asset(
                    SvgIcons.hotel,
                    height: 50,
                    color: ColorPalette.greenColor,
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 2,
                  child: InkWell(
                    onTap: () {
                      debugPrint('Удалить фотографию ${widget.index}');
                      context.read<AddSightModel>().deletePhoto(widget.index);
                    },
                    child: SvgPicture.asset(
                      SvgIcons.clearWhite,
                      height: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
