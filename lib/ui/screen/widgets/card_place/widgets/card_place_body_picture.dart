import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/img.dart';

class CardPlaceBodyPicture extends StatelessWidget {
  final double heightImage;
  final Place _place;

  const CardPlaceBodyPicture({
    Key? key,
    required this.heightImage,
    required Place place,
  })  : _place = place,
        super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: heightImage,
      child: (_place.urls.length == 1 && _place.urls.first == noPhoto)
          ? Image.asset(
              noPhoto,
              height: 120,
              width: 122,
              fit: BoxFit.cover,
            )
          : Image.network(
              _place.urls.first,
              fit: BoxFit.fitWidth,
            ),
    );
  }
}
