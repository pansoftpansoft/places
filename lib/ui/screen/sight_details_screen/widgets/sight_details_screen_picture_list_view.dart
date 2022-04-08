import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/sight_details_screen_picture_list_view_text.dart';

class SightDetailsScreenPictureListView extends StatelessWidget {
  final Sight _sight;

  const SightDetailsScreenPictureListView(
    this._sight, {
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
          child: SightDetailsScreenPictureListViewText(_sight),
        ),
      ],
    );
  }
}
