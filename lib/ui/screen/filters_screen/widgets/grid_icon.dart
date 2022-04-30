import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/filters_screen/widgets/category_icon.dart';

///Область расположения кнопок
class GridIcon extends StatelessWidget {
  ///
  const GridIcon({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    const typePlaceList = <Widget>[
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
    ];

    return height > 1000
        ? GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            children: typePlaceList,
          )
        : SizedBox(
            height: 150.0,
            child: ListView(
              padding: const EdgeInsets.only(right: 30),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: typePlaceList,
            ),
          );
  }
}
