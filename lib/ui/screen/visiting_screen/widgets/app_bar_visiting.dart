import 'package:flutter/material.dart';
import 'package:places/ui/res/color_palette.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';

///
class AppBarVisiting extends StatelessWidget {
  ///
  const AppBarVisiting({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => AppBar(
        title: Text(
          checkFavorites,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(borderRadiusTapBar),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingPage),
            child: Material(
              color: ColorPalette.lmCardColor,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadiusTapBar),
              ),
              child: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: iWantToVisit,
                  ),
                  Tab(text: visited),
                ],
              ),
            ),
          ),
        ),
      );
}
