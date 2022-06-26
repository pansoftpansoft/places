import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/place_type.dart';

class CardPlaceBodyTextType extends StatelessWidget {
  ///
  final Place _place;

  ///
  const CardPlaceBodyTextType(
    this._place, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      top: 18,
      child: Text(
        PlaceType(_place.placeType).namePlaceTranslate,
        style: Theme.of(context).textTheme.headline5!.copyWith(
              color: const Color(0xFFFFFFFF),
            ),
      ),
    );
  }
}
