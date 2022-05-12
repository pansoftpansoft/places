import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';

class SightCardBodyPicture extends StatelessWidget {
  final double heightImage;
  final Place _sight;

  const SightCardBodyPicture({
    Key? key,
    required this.heightImage,
    required Place sight,
  })  : _sight = sight,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: heightImage,
      child: Image.network(
        _sight.urls.first,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
