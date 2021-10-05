import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';

class TitleField extends StatelessWidget {
  final String label;

  const TitleField(
      this.label, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: Sizes.opacityText,
      child: Text(
        this.label,
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
          fontSize: 12,
        ),
      ),
    );
  }
}