import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/details_place_screen/widgets/add_to_favorites_button.dart';
import 'package:places/ui/screen/details_place_screen/widgets/build_route_button.dart';
import 'package:places/ui/screen/details_place_screen/widgets/details_place_screen_picture_list_view_type.dart';
import 'package:places/ui/screen/details_place_screen/widgets/schedule_button.dart';
import 'package:places/ui/screen/widgets/sized_box_24.dart';

class DetailsPlaceScreenPictureListViewText extends StatelessWidget {
  final Place _place;

  const DetailsPlaceScreenPictureListViewText(
    this._place, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          _place.name,
          style: Theme.of(context).textTheme.headline3,
        ),
        DetailsPlaceScreenPictureListViewType(_place),
        const SizedBox24(),
        Text(
          _place.description,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox24(),
        ConstrainedBox(
          constraints: const BoxConstraints.tightFor(
            height: 48,
          ),
          child: BuildRouteButton(_place),
        ),
        const SizedBox24(),
        const Divider(),
        SizedBox(
          height: heightSizeBox48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const ScheduleButton(),
              AddToFavoritesButton(_place),
            ],
          ),
        ),
      ],
    );
  }
}
