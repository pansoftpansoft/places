import 'package:flutter/material.dart';
import 'package:places/ui/screen/filters_screen/widgets/app_bar_title_button_cancel.dart';
import 'package:places/ui/screen/filters_screen/widgets/app_bar_title_button_clear.dart';

///AppBarTitle
class AppBarTitle extends StatelessWidget {
  ///
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          AppBarTitleButtonCancel(),
          AppBarTitleButtonClear(),
        ],
      );
}
