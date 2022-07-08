import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';
import 'package:places/ui/screen/add_place_screen/widgets/add_place_app_bar_button_return.dart';

///
class AddPlaceAppBar extends StatelessWidget {
  ///
  const AddPlaceAppBar({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: <Widget>[
              const AddPlaceAppBarButtonReturn(),
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
