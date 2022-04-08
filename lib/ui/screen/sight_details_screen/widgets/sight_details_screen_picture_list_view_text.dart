import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/add_to_favorites_button.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/build_route_button.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/schedule_button.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/sight_details_screen_picture_list_view_type.dart';
import 'package:places/ui/screen/widgets/sized_box_24.dart';

class SightDetailsScreenPictureListViewText extends StatelessWidget {
  final Sight _sight;

  const SightDetailsScreenPictureListViewText(
    this._sight, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          _sight.name,
          style: Theme.of(context).textTheme.headline3,
        ),
        SightDetailsScreenPictureListViewType(_sight),
        const SizedBox24(),
        Text(
          _sight.details,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox24(),
        ConstrainedBox(
          constraints: const BoxConstraints.tightFor(
            height: 48,
          ),
          child: const BuildRouteButton(),
        ),
        const SizedBox24(),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            ScheduleButton(),
            AddToFavoritesButton(),
          ],
        ),
      ],
    );
  }
}
