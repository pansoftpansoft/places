import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/filters_screen/widgets/category_icon.dart';

///
class GridIcon extends StatelessWidget {
  ///
  const GridIcon({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        children: const <Widget>[
          CategoryIcon(
            'Отель',
            TypePlace.hotel,
            SvgIcons.hotel,
          ),
          CategoryIcon(
            'Ресторан',
            TypePlace.restaurant,
            SvgIcons.restaurant,
          ),
          CategoryIcon(
            'Особое место',
            TypePlace.particularPlace,
            SvgIcons.particularPlace,
          ),
          CategoryIcon(
            'Парк',
            TypePlace.park,
            SvgIcons.park,
          ),
          CategoryIcon(
            'Музей',
            TypePlace.museum,
            SvgIcons.museum,
          ),
          CategoryIcon(
            'Кафе',
            TypePlace.cafe,
            SvgIcons.cafe,
          ),
        ],
      );
}
