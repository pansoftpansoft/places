import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/data/model/place_type.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/screen/filters_screen/bloc/filter_bloc.dart';
import 'package:places/ui/screen/filters_screen/widgets/category_icon_tick_choice.dart';

class CategoryIconSvgIcon extends StatefulWidget {
  ///
  final PlaceType placeType;

  const CategoryIconSvgIcon(
    this.placeType, {
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
              widget.placeType.svgIcons,
              height: 40,
              color: ColorPalette.greenColor,
            ),
          ),
        ),
        CategoryIconTickChoice(widget.placeType.namePlaceDB),
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
    context.read<FilterBloc>().add(
          FilterEvents.updateFilterCategory(
            selectedCategory: widget.placeType.namePlaceDB,
          ),
        );
  }
}
