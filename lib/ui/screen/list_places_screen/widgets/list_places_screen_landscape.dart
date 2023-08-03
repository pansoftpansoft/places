import 'package:flutter/material.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/list_places_screen/widgets/sticky_header.dart';
import 'package:places/ui/screen/widgets/card_place/card_place.dart';
import 'package:provider/provider.dart';

class ListPlacesScreenLandscape extends StatelessWidget {
  const ListPlacesScreenLandscape({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchInteractor>(builder: (
      final context,
      final cart,
      final child,
    ) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: StickyHeader(),
              pinned: true,
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (
                  final context,
                  final index,
                ) =>
                    CardPlace(mocksFiltered[index]),
                childCount: mocksFiltered.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 36,
                mainAxisSpacing: 16.0,
                childAspectRatio: 30 / 26,
              ),
            ),
          ],
        ),
      );
    });
  }
}
