import 'package:flutter/material.dart';
import 'package:places/ui/res/route_name.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/widgets/search_bar.dart';
import 'package:places/ui/screen/widgets/title_app_big_or_small.dart';

/// AppBar главного списка
class AppBarSightListScreen extends StatelessWidget {
  ///Уменьшать AppBar false-большой , true- маленький
  final bool shrink;

  ///
  const AppBarSightListScreen({
    final Key? key,
    this.shrink = false,
  }) : super(key: key);

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
              paddingPage,
            ),
            child: shrink
                ? const SizedBox.shrink()
                : Stack(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: paddingPage,
                        ),
                        child: SearchBar(),
                      ),
                      SizedBox(
                        height: heightTextFieldSearch,
                        child: InkWell(
                          onTap: () {_onPress(context);},
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      );

  void _onPress(BuildContext context) {
    Navigator.pushNamed(context, RouteName.sightSearchScreen);
  }
}
