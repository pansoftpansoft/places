import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/sight_search_screen/sight_search_screen.dart';
import 'package:places/ui/screen/widgets/search_bar.dart';
import 'package:places/ui/screen/widgets/title_app.dart';

///
class AppBarSightListScreen extends StatelessWidget {
  ///
  const AppBarSightListScreen({
    final Key? key,
    this.shrink = false,
  }) : super(key: key);

  final bool shrink;

  @override
  Widget build(final BuildContext context) => AppBar(
        toolbarHeight: double.infinity,
        centerTitle: false,
        elevation: 0,
        title: shrink
            ? Text(
                Labels.list_interesting_places,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
              )
            : const TitleApp(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              Sizes.paddingPage,
              0,
              Sizes.paddingPage,
              Sizes.paddingPage,
            ),
            child: shrink
                ? const SizedBox.shrink()
                : Stack(
                    children: <Widget>[
                      SearchBar(),
                      SizedBox(
                        height: Sizes.heightTextFieldSearch,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<Route>(
                                builder: (final BuildContext context) =>
                                    const SightSearchScreen(),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
          ),
        ),
      );
}
