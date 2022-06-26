import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/filters_screen/model/filters_screen_model.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/sticky_header.dart';
import 'package:places/ui/screen/widgets/sight_card/card_place.dart';
import 'package:provider/provider.dart';

class ListPlacesScreenPortrait extends StatelessWidget {
  const ListPlacesScreenPortrait({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FiltersScreenModel>(builder: (
      final context,
      final cart,
      final child,
    ) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: paddingPage,
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: StickyHeader(),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (
                  final context,
                  final index,
                ) {
                  debugPrint(' mocksFiltered[$index].isFavorites = ${mocksFiltered[index].isFavorites}');

                  return CardPlace(mocksFiltered[index]);
                },
                childCount: mocksFiltered.length,
              ),
            ),
          ],
        ),
      );
    });
  }
}
