import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/sticky_header.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:places/ui/screen/widgets/sight_card/sight_card.dart';
import 'package:provider/provider.dart';

class SightListScreenLandscape extends StatelessWidget {
  const SightListScreenLandscape({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchFilterModel>(builder: (
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
                    SightCard(mocksSearch[index]),
                childCount: mocksSearch.length,
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
