import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/select_category.dart';

///
class BottomSheetSaveButton extends StatelessWidget {
  ///
  const BottomSheetSaveButton(
    this.widget, {
    final Key? key,
  }) : super(key: key);

  ///
  final SelectCategory widget;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: paddingPage,
          vertical: paddingPage / 2,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(height: 48),
          child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              elevation: MaterialStateProperty.all(0),
              backgroundColor: widget.typePlaceSelected == null
                  ? MaterialStateProperty.all<Color>(ColorPalette.dmBasicColor)
                  : MaterialStateProperty.all<Color>(ColorPalette.greenColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadiusCard),
                ),
              ),
            ),
            onPressed: widget.typePlaceSelected == null
                ? null
                : () {
                    Navigator.pop(context, widget.typePlaceSelected);
                  },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  save,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: widget.typePlaceSelected == null
                            ? ColorPalette.lmFontHeadline2
                                .withOpacity(opacityText)
                            : ColorPalette.lmPrimaryColor,
                      ),
                ),
              ],
            ),
          ),
        ),
      );
}
