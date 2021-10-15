import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';

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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TabBar(
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
