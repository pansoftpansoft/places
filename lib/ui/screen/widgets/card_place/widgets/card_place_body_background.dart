import 'package:flutter/material.dart';

class CardPlaceBodyBackground extends StatelessWidget {
  final double heightImage;

  const CardPlaceBodyBackground({
    Key? key,
    required this.heightImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: heightImage,
      child: Container(
        height: 500,
        width: 500,
        color: Theme.of(context).cardTheme.color,
      ),
    );
  }
}
