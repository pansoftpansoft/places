import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/app_bar_add_sight_button_return.dart';

///
class AppBarAddSight extends StatelessWidget {
  ///
  const AppBarAddSight({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: <Widget>[
              const AppBarAddSightButtonReturn(),
              Expanded(
                child: Text(
                  newPlace,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              const Expanded(
                child: SizedBox(
                  width: 30,
                ),
              ),
            ],
          ),
        ),
      );
}
