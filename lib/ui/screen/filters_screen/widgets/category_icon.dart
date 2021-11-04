import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/filters_screen/filters_screen.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';

///Макет кнопки фильтра
class CategoryIcon extends StatelessWidget {
  ///
  const CategoryIcon(
    final this.nameIcon,
    final this.nameKey,
    final this.svgIcons, {
    final Key? key,
  }) : super(key: key);

  ///
  final String nameIcon;

  ///
  final TypePlace nameKey;

  ///
  final String svgIcons;

  @override
  Widget build(final BuildContext context) => Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Ink(
                decoration: const ShapeDecoration(
                  color: ColorPalette.greenColorLight,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  iconSize: 53,
                  //color: ,
                  onPressed: () {
                    FiltersScreen.setButtonSelect(context, nameKey);
                    FiltersScreen.setFilter(context);
                  },
                  icon: SvgPicture.asset(
                    svgIcons,
                    height: 40,
                    color: ColorPalette.greenColor,
                  ),
                ),
              ),
              Positioned(
                bottom: -4,
                right: -4,
                child: SearchFilterModel.filterMap[nameKey]!
                    ? SvgPicture.asset(
                        SvgIcons.tickChoice,
                        height: 25,
                      )
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            nameIcon,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      );
}
