import 'package:flutter/material.dart';

///
class LoadScreen extends StatelessWidget {
  ///
  const LoadScreen({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      );
}
