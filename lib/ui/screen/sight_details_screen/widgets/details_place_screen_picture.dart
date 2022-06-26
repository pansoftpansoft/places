import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/details_place_screen_picture_sliver_app_bar.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/details_place_screen_picture_list_view.dart';

class DetailsPlaceScreenPicture extends StatelessWidget {
  final Place place;

  const DetailsPlaceScreenPicture(
    this.place, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        DetailsPlaceScreenPictureSliverAppBar(place),
        SliverFillRemaining(
          child: DetailsPlaceScreenPictureListView(place),
        ),
      ],
    );
  }
}
