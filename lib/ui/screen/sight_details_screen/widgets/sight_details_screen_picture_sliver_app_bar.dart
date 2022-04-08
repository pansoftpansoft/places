import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_details_screen/widgets/photo_gallery.dart';

class SightDetailsScreenPictureSliverAppBar extends StatelessWidget {
  const SightDetailsScreenPictureSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 330,
      flexibleSpace: FlexibleSpaceBar(
        background: PhotoGallery(),
      ),
    );
  }
}
