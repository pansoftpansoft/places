import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/bottom_sheet_create_button_row.dart';
import 'package:places/ui/screen/sight_list_screen/models/sight_list_screen_model.dart';
import 'package:provider/provider.dart';

class AddElevatedButton extends StatelessWidget {
  const AddElevatedButton({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddSightModel>(
      builder: (
        final context,
        final sight,
        final child,
      ) =>
          ElevatedButton(
        style: context.read<AddSightModel>().disableButton == null
            ? _buildButtonStyleDisable()
            : _buildButtonStyle(),
        child: BottomSheetCreateButtonRow(context: context),
        onPressed: context.read<AddSightModel>().disableButton == null
            ? null
            : () {
                final sight = Sight(
                  'Ивановская площадь',
                  '55.751426',
                  '37.618879',
                  'https://static.mk.ru/upload/entities/2017/12/21/articles/facebookPicture/ce/31/98/e7/d15fd0053ec3372a03dc97795b74a33f.jpg',
                  details,
                  TypePlace.park,
                );
                mocks.add(
                  sight,
                );
                context.read<SightListScreenModel>().updateSightList();
                Navigator.pop(context);
              },
      ),
    );
  }

  ButtonStyle _buildButtonStyle() {
    return ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      elevation: MaterialStateProperty.all(0),
      backgroundColor:
          MaterialStateProperty.all<Color>(ColorPalette.greenColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadiusCard16)),
        ),
      ),
    );
  }

  ButtonStyle _buildButtonStyleDisable() {
    return ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      elevation: MaterialStateProperty.all(0),
      backgroundColor:
          MaterialStateProperty.all<Color>(ColorPalette.dmBasicColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadiusCard16)),
        ),
      ),
    );
  }
}
