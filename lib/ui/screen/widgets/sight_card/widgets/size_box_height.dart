import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';

class SizeBoxHeight extends StatelessWidget {
  const SizeBoxHeight({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: height95,
    );
  }
}
