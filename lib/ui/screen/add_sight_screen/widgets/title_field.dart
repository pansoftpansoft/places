import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';

///
class TitleField extends StatelessWidget {
  ///
  const TitleField(
    this.label, {
    final Key? key,
  }) : super(key: key);

  ///
  final String label;

  @override
  Widget build(final BuildContext context) => Opacity(
        opacity: Sizes.opacityText,
        child: Text(
          label,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontSize: 12,
              ),
        ),
      );
}
