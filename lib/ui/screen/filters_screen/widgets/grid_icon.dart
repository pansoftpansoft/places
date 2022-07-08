import 'package:flutter/material.dart';
import 'package:places/data/model/place_type.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/filters_screen/widgets/category_icon.dart';

///Область расположения кнопок
class GridIcon extends StatelessWidget {
  ///
  const GridIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final typePlaceList = <Widget>[
      CategoryIcon(
        PlaceType('hotel'),
      ),
      CategoryIcon(
        PlaceType('restaurant'),
      ),
      CategoryIcon(
        PlaceType('particularPlace'),
      ),
      CategoryIcon(
        PlaceType('park'),
      ),
      CategoryIcon(
        PlaceType('museum'),
      ),
      CategoryIcon(
        PlaceType('cafe'),
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
