import 'package:flutter/material.dart';

class PhotoGalleryPicture extends StatelessWidget {
  final String photoUrl;

  const PhotoGalleryPicture(
    this.photoUrl, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      photoUrl,
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
