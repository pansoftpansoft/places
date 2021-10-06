import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';

class AppBarAddSight extends StatelessWidget {
  const AppBarAddSight({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  alignment: Alignment.centerLeft,
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(0),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  Labels.cancel,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                Labels.newPlace,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const Expanded(
              child: SizedBox(
                width: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
