import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
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
        hotel,
        TypePlace.hotel,
        SvgIcons.hotel,
      ),
      CategoryIcon(
        restaurant,
        TypePlace.restaurant,
        SvgIcons.restaurant,
      ),
      CategoryIcon(
        particularPlace,
        TypePlace.particularPlace,
        SvgIcons.particularPlace,
      ),
      CategoryIcon(
        park,
        TypePlace.park,
        SvgIcons.park,
      ),
      CategoryIcon(
        museum,
        TypePlace.museum,
        SvgIcons.museum,
      ),
      CategoryIcon(
        cafe,
        TypePlace.cafe,
        SvgIcons.cafe,
      ),
    ];

    debugPrint('$height < $maxHeightSmallScreen');

    return height < maxHeightSmallScreen
        ? SizedBox(
            height: 150.0,
            child: ListView(
              padding: const EdgeInsets.only(right: 30),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: typePlaceList,
            ),
          )
        : GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            children: typePlaceList,
          );
  }
}
