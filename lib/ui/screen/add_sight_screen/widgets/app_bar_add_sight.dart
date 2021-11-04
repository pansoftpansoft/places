import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';

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
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.zero,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    cancel,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                ),
              ),
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
