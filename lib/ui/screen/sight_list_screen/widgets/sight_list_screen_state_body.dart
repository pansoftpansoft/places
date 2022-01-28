import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/sticky_header.dart';
import 'package:places/ui/screen/widgets/sight_card/sight_card.dart';

class SightListScreenStateBody extends StatelessWidget {
  const SightListScreenStateBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(
                horizontal: paddingPage,
              ),
              child: SightCard(mocks[index]),
            ),
            childCount: mocks.length,
          ),
        ),
      ],
    );
  }
}
