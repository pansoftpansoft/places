import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';

///
class BottomSheetCreateButtonRow extends StatelessWidget {
  ///
  final BuildContext context;

  ///
  const BottomSheetCreateButtonRow({
    Key? key,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          create,
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: ColorPalette.lmPrimaryColor,
              ),
        ),
      ],
    );
  }
}
