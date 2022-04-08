import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/sight_details_screen_picture_list_view.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/sight_details_screen_picture_sliver_app_bar.dart';

class SightDetailsScreenPicture extends StatelessWidget {
  final Sight _sight;

  const SightDetailsScreenPicture({
    Key? key,
    required Sight sight,
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
