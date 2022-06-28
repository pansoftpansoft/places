import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/screen/details_place_screen/widgets/photo_gallery.dart';

class DetailsPlaceScreenPictureSliverAppBar extends StatelessWidget {
  final Place place;
  const DetailsPlaceScreenPictureSliverAppBar(
      this.place,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 330,
      flexibleSpace: FlexibleSpaceBar(
        background: PhotoGallery(place),
      ),
    );
  }
}
