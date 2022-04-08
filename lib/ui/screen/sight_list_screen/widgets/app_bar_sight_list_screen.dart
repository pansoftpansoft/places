import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/widgets/search_bar_first.dart';
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
        toolbarHeight: 100,
        centerTitle: false,
        elevation: 0,
        title: TitleAppBigOrSmall(small: !shrink),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: shrink
              ? const Padding(
                  padding: EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: paddingPage,
                  ),
                  child: SearchBarFirst(),
                )
              : const Padding(
                  padding: EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: paddingPage,
                  ),
                  child: SearchBarFirst(),
                ),
        ),
      );
}
