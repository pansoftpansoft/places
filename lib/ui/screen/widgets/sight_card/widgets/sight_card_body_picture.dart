import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class SightCardBodyPicture extends StatelessWidget {
  final double heightImage;
  final Sight _sight;

  const SightCardBodyPicture({
    Key? key,
    required this.heightImage,
    required Sight sight,
  })  : _sight = sight,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: heightImage,
      child: Image.network(
        _sight.url,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
