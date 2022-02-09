import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/add_sight_screen/models/add_sight_model.dart';
import 'package:provider/provider.dart';


class BottomSheetSaveButtonBody extends StatelessWidget {
  const BottomSheetSaveButtonBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(height: 48),
      child: ElevatedButton(
        style: _buildButtonStyle(
          context.read<AddSightModel>().selectTypePlace,
        ),
        onPressed: () {
          _onPressed(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              save,
              style: _buildTextStyle(context),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle _buildButtonStyle(final TypePlace? selectTypePlace) {
    debugPrint('Цвет кнопки');

    return ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      elevation: MaterialStateProperty.all(0),
      backgroundColor: selectTypePlace == null
          ? MaterialStateProperty.all<Color>(ColorPalette.dmBasicColor)
          : MaterialStateProperty.all<Color>(ColorPalette.greenColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadiusCard16)),
        ),
      ),
    );
  }

  TextStyle _buildTextStyle(final BuildContext context) {
    return Theme.of(context).textTheme.headline5!.copyWith(
          color: context.read<AddSightModel>().selectTypePlace == null
              ? ColorPalette.lmFontHeadline2.withOpacity(opacityText)
              : ColorPalette.lmPrimaryColor,
        );
  }

  void _onPressed(final BuildContext context) {
    if (context.read<AddSightModel>().selectTypePlace != null) {
      _navigator(context);
    }
  }

  void _navigator(final BuildContext context) {
    Navigator.pop(
      context,
      context.read<AddSightModel>().selectTypePlace,
    );
  }
}
