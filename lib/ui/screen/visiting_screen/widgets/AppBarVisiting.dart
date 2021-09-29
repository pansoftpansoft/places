import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';

class AppBarVisiting extends StatelessWidget {
  const AppBarVisiting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        Labels.checkFavorites,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline4,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: const TabBar(
              tabs: [
                const Tab(
                  text: Labels.iWantToVisit,
                ),
                const Tab(text: Labels.visited),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
