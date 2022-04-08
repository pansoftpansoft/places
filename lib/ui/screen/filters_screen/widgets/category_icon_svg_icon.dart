import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/screen/filters_screen/filters_screen.dart';
import 'package:places/ui/screen/filters_screen/widgets/category_icon_tick_choice.dart';

class CategoryIconSvgIcon extends StatefulWidget {
  ///
  final String nameIcon;

  ///
  final TypePlace nameKey;

  ///
  final String svgIcons;

  ///

  const CategoryIconSvgIcon(
    this.nameIcon,
    this.nameKey,
    this.svgIcons, {
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryIconSvgIcon> createState() => _CategoryIconSvgIconState();
}

class _CategoryIconSvgIconState extends State<CategoryIconSvgIcon> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Ink(
          decoration: _buildShapeDecoration(),
          child: IconButton(
            iconSize: 53,
            onPressed: _onPressed,
            icon: SvgPicture.asset(
              widget.svgIcons,
              height: 40,
              color: ColorPalette.greenColor,
            ),
          ),
        ),
        CategoryIconTickChoice(widget.nameKey),
      ],
    );
  }

  ShapeDecoration _buildShapeDecoration() {
    return const ShapeDecoration(
      color: ColorPalette.greenColorLight,
      shape: CircleBorder(),
    );
  }

  void _onPressed() {
    FiltersScreen.setButtonSelect(context, widget.nameKey);
    FiltersScreen.setFilter(context);
    setState(() {
      debugPrint('Обновить даные');
    });
  }
}
