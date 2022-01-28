import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/labels.dart';

class SightDetailsScreenPictureListViewType extends StatelessWidget {
  final Sight _sight;

  const SightDetailsScreenPictureListViewType(
    this._sight, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          typePlaceString(_sight.type),
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(width: 16),
        Text(
          'закрыто до 09:00',
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}
