import 'package:flutter/material.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/sticky_header.dart';
import 'package:places/ui/screen/sight_search_screen/models/search_filter_model.dart';
import 'package:places/ui/screen/widgets/sight_card/sight_card.dart';
import 'package:provider/provider.dart';

class SightListScreenStateBody extends StatelessWidget {
  const SightListScreenStateBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchFilterModel>(builder: (
      final context,
      final cart,
      final child,
    ) {
      return CustomScrollView(
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
                  Padding(
                padding: const EdgeInsets.fromLTRB(
                  heightSizeBox12,
                  0,
                  heightSizeBox12,
                  heightSizeBox12,
                ),
                child: SightCard(mocksSearch[index]),
              ),
              childCount: mocksSearch.length,
            ),
          ),
        ],
      );
    });
  }
}
