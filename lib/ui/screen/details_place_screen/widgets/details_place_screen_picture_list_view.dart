import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/details_place_screen/widgets/details_place_screen_picture_list_view_text.dart';

class DetailsPlaceScreenPictureListView extends StatelessWidget {
  final Place _place;

  const DetailsPlaceScreenPictureListView(
    this._place, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(
            paddingPage,
            24,
            paddingPage,
            0,
          ),
          child: DetailsPlaceScreenPictureListViewText(_place),
        ),
      ],
    );
  }
}
