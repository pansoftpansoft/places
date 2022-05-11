import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/labels.dart';

class SightCardBodyTextType extends StatelessWidget {
  ///
  final Sight _sight;

  ///
  const SightCardBodyTextType(
    this._sight, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      top: 18,
      child: Text(
       _sight.placeType,
        style: Theme.of(context).textTheme.headline5!.copyWith(
              color: const Color(0xFFFFFFFF),
            ),
      ),
    );
  }
}
