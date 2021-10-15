import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/app_bar_sight_list_screen.dart';

///Упрваления AppBarSightListScreen при прокрутке списка
class StickyHeader extends SliverPersistentHeaderDelegate {
  bool _shrink = false;

  @override
  Widget build(
    final BuildContext context,
    final double shrinkOffset,
    final bool overlapsContent,
  ) {
    _shrink = shrinkOffset < 50 ? false : true;

    return AppBarSightListScreen(shrink: _shrink);
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(
    covariant final SliverPersistentHeaderDelegate oldDelegate,
  ) =>
      false;
}
