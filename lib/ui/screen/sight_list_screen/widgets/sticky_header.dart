import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen/widgets/list_places_screen_app_bar.dart';

///Упрваления AppBarSightListScreen при прокрутке списка
class StickyHeader extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 190;

  @override
  double get minExtent => 110;

  bool _shrink = false;

  @override
  Widget build(
    final BuildContext context,
    final double shrinkOffset,
    final bool overlapsContent,
  ) {
    _shrink = shrinkOffset < 60;

    return ListPlacesScreenAppBar(shrink: _shrink);
  }

  @override
  bool shouldRebuild(
    covariant final SliverPersistentHeaderDelegate oldDelegate,
  ) =>
      false;
}
