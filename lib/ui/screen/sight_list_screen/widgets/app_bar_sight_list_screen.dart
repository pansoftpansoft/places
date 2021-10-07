import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/sight_search_screen/sight_search_screen.dart';
import 'package:places/ui/screen/widgets/search_bar.dart';
import 'package:places/ui/screen/widgets/title_app.dart';

///
class AppBarSightListScreen extends StatelessWidget {
  ///
  const AppBarSightListScreen({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => AppBar(
      toolbarHeight: double.infinity,
      centerTitle: false,
      elevation: 0,
      title: const TitleApp(),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            Sizes.paddingPage,
            0,
            Sizes.paddingPage,
            Sizes.paddingPage,
          ),
          child: Stack(
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
