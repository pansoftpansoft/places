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
    this.shrink = false,
  }) : super(key: key);

  ///Уменьшать AppBar false-большой , true- маленький
  final bool shrink;

  @override
  Widget build(final BuildContext context) => AppBar(
        toolbarHeight: double.infinity,
        centerTitle: false,
        elevation: 0,
        title: TitleAppBigOrSmall(small: shrink),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              0,
              0,
              0,
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
                              MaterialPageRoute<void>(
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
