import 'package:flutter/material.dart';

import 'package:places/type_place.dart';

class PhotoGalleryPicture extends StatelessWidget {
  final int index;

  const PhotoGalleryPicture(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      tempPhotoPlace[index],
      fit: BoxFit.cover,
      loadingBuilder: (
        final context,
        final child,
        final progress,
      ) =>
          progress == null
              ? child
              : const UnconstrainedBox(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(),
                  ),
                ),
    );
  }
}
