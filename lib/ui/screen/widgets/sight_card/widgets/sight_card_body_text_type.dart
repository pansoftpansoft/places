import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';

class SightCardBodyTextType extends StatelessWidget {
  ///
  final Place _sight;

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
