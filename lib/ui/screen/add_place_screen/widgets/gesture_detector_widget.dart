import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/data/interactor/add_place_interactor.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:provider/provider.dart';

///Оработка жестов по удаление фотографий с экрана "Добавить новое место"
class GestureDetectorWidget extends StatefulWidget {
  ///
  const GestureDetectorWidget({
    final Key? key,
  }) : super(key: key);

  @override
  State<GestureDetectorWidget> createState() => _GestureDetectorWidgetState();
}

class _GestureDetectorWidgetState extends State<GestureDetectorWidget> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.only(left: 16, right: 16),
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorPalette.greenColor.withOpacity(0.48),
              width: 2,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: UnconstrainedBox(
            child: InkWell(
              onTap: () {
                debugPrint('100');
                context.read<AddPlaceInteractor>().addPhoto('100');
              },
              child: SvgPicture.asset(
                SvgIcons.union,
                height: 24,
                color: ColorPalette.greenColor,
              ),
            ),
          ),
        ),
      );
}
