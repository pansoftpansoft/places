import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/screen/details_place_screen/widgets/details_place_screen_picture_list_view.dart';
import 'package:places/ui/screen/details_place_screen/widgets/details_place_screen_picture_sliver_app_bar.dart';

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
