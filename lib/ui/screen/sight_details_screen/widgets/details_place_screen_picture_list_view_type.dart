import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/place_type.dart';

class DetailsPlaceScreenPictureListViewType extends StatelessWidget {
  final Place _place;

  const DetailsPlaceScreenPictureListViewType(
    this._place, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Row(
        children: <Widget>[
          Text(
            PlaceType(_place.placeType).namePlaceTranslate,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(width: 16),
          Text(
            'закрыто до 09:00',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
