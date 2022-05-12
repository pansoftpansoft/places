import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/sight_details_screen_picture_list_view.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/sight_details_screen_picture_sliver_app_bar.dart';

class SightDetailsScreenPicture extends StatelessWidget {
  final Place _sight;

  const SightDetailsScreenPicture({
    Key? key,
    required Place sight,
  })  : _sight = sight,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SightDetailsScreenPictureSliverAppBar(),
        SliverFillRemaining(
          child: SightDetailsScreenPictureListView(_sight),
        ),
      ],
    );
  }
}
