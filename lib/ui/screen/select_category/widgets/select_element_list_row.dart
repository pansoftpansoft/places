import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/svg_icons.dart';

///
class SelectElementListRow extends StatelessWidget {
  final String currentSelectCategory;
  final String typePlaceSelected;

  const SelectElementListRow({
    required this.currentSelectCategory,
    required this.typePlaceSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          typePlaceSelected,
          style: Theme.of(context).textTheme.headline4!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
        ),
        if (typePlaceSelected == currentSelectCategory)
          SvgPicture.asset(
            SvgIcons.tick,
            color: ColorPalette.greenColor,
          ),
      ],
    );
  }
}
