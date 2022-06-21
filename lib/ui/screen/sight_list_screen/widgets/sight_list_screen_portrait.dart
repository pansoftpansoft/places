import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/filters_screen/model/filters_screen_model.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/sticky_header.dart';
import 'package:places/ui/screen/widgets/sight_card/sight_card.dart';
import 'package:provider/provider.dart';

class SightListScreenPortrait extends StatelessWidget {
  const SightListScreenPortrait({
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
                ) =>
                    SightCard(mocksFiltered[index]),
                childCount: mocksFiltered.length,
              ),
            ),
          ],
        ),
      );
    });
  }
}
