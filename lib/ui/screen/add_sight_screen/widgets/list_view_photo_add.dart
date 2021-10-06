import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:provider/provider.dart';

class ListViewPhotoAdd extends StatelessWidget {
  const ListViewPhotoAdd({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddSightModel>(
      builder: (context, sight, child) {
        return Expanded(
          child: ListView.builder(
              itemCount: AddSightModel.tempPhotoPlace.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return ButtonImage(context, index);
              }),
        );
      },
    );
  }
}

Widget ButtonImage(BuildContext context, int index) {
  //print('index $index');
  //print('tempPhotoPlace ${AddSightModel.tempPhotoPlace.length}');
  return index == 0
      ? GestureDetector(
          onTap: () {
            print('GestureDetector');
            var _AddSightModel = context.read<AddSightModel>();
            _AddSightModel.AddPhoto('');
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorPalette.greenColor.withOpacity(0.48),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: UnconstrainedBox(
                child: SvgPicture.asset(
                  SvgIcons.union,
                  height: 24,
                  color: ColorPalette.greenColor,
                ),
              ),
            ),
          ),
        )
      : Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Dismissible(
            direction: DismissDirection.up,
            onDismissed: (direction) {
              var _AddSightModel = context.read<AddSightModel>();
              _AddSightModel.DeletePhoto(index);
            },
            key: UniqueKey(),
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: ColorPalette.dmPrimaryColor,
                border: Border.all(color: ColorPalette.greenColor, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
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
                        var _AddSightModel = context.read<AddSightModel>();
                        _AddSightModel.DeletePhoto(index);
                      },
                      child: SvgPicture.asset(
                        SvgIcons.clear_white,
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
