import 'package:flutter/material.dart';
import 'package:places/ui/res/labels.dart';

///
class BottomSheetCreateButtonRow extends StatelessWidget {
  ///
  final BuildContext context;

  ///
  const BottomSheetCreateButtonRow({
    Key? key,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text(
          create,
        ),
      ],
    );
  }
}
