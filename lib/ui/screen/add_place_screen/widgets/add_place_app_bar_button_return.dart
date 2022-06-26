import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';

class AddPlaceAppBarButtonReturn extends StatelessWidget {
  const AddPlaceAppBarButtonReturn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
